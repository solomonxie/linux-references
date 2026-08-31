#!/usr/bin/env bash
# Run: sh ns_04_mount_namespace.sh (needs root)
# What this step adds: mount namespaces and changing a process's view of the filesystem root.
# Step 4: mount namespace

unshare --net bash -c 'ip addr show'
ip netns add demo_ns; ip netns delete demo_ns

# Step 4: --mount isolates the mount table; mounts inside don't leak out
mkdir -p /tmp/ns_demo
unshare --mount bash -c 'mount -t tmpfs tmpfs /tmp/ns_demo; mount | grep ns_demo'
mount | grep ns_demo   # nothing — the mount above didn't escape the namespace

# Step 4: chroot changes the apparent root, without a new mount namespace
mkdir -p /tmp/ns_root/bin
cp /bin/busybox /tmp/ns_root/bin/ 2>/dev/null || cp /bin/ls /tmp/ns_root/bin/
chroot /tmp/ns_root /bin/busybox ls / 2>/dev/null || chroot /tmp/ns_root /bin/ls /

# Step 4: pivot_root (used by real container runtimes) additionally swaps
# out the old root entirely instead of just changing what "/" resolves to
rm -rf /tmp/ns_demo /tmp/ns_root
