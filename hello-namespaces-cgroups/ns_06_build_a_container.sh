#!/usr/bin/env bash
# Run: sh ns_06_build_a_container.sh (needs root)
# What this step adds: advanced — combining namespaces + chroot + cgroups
# into the minimal shape of what a container runtime does.
# Step 6: build a minimal container

mkdir -p /sys/fs/cgroup/demo_cg
echo "50M" > /sys/fs/cgroup/demo_cg/memory.max

# Step 6: a tiny root filesystem
mkdir -p /tmp/mini_container/bin
cp /bin/busybox /tmp/mini_container/bin/ 2>/dev/null

# Step 6: isolate PID + mount + net + UTS, then chroot into the mini rootfs,
# and cap its resources via the cgroup created above
(
  echo $$ > /sys/fs/cgroup/demo_cg/cgroup.procs
  unshare --pid --net --uts --mount --fork --mount-proc \
    chroot /tmp/mini_container /bin/busybox sh -c '
      hostname mini-container
      /bin/busybox ps
      /bin/busybox ls /
    '
)

rmdir /sys/fs/cgroup/demo_cg
rm -rf /tmp/mini_container

# Step 6: this is the mechanism, not a real runtime — no image layers,
# no OCI spec, no network bridge; runc/containerd add all of that on top
