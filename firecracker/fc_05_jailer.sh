#!/usr/bin/env bash
# Run: sh fc_05_jailer.sh (needs root; same images as step 2)
# What this step adds: the jailer -- sandboxing Firecracker's own process,
# the other half of the security story (steps 1-4 sandbox the *guest*;
# this sandboxes the *VMM process* running on the host).
# Step 5: jailer

cd ~/fc_demo

# Step 5: jailer wraps the firecracker binary, then chroots it, applies a
# seccomp filter, and moves it into cgroups -- so even a Firecracker VMM
# process compromised via a guest-escape bug has almost nothing to work
# with on the host (see namespaces-cgroups, kern for the same
# primitives used elsewhere)
sudo jailer --id demo-vm --exec-file /usr/local/bin/firecracker \
  --uid 123 --gid 100 \
  --chroot-base-dir /srv/jailer \
  -- --api-sock /run/firecracker.socket

# Step 5: the jail's chroot ends up under
#   /srv/jailer/firecracker/demo-vm/root/
# -- only files explicitly bind-mounted in (kernel, rootfs) are visible
# inside it; boot-source/drives paths in step 3's API calls must be given
# relative to this chroot, not the host's real path
