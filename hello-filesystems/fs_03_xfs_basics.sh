#!/usr/bin/env bash
# Run: sh fs_03_xfs_basics.sh (needs root + a spare block device/loop file)
# What this step adds: creating and inspecting an XFS filesystem.
# Step 3: xfs basics

dd if=/dev/zero of=/tmp/xfs.img bs=1M count=200
losetup -fP /tmp/xfs.img
LOOPDEV=$(losetup -j /tmp/xfs.img | cut -d: -f1)

# Step 3: create the filesystem
mkfs.xfs "$LOOPDEV"

# Step 3: inspect it
xfs_info "$LOOPDEV"

# Step 3: xfs grows online only, never shrinks — mount it, then:
mkdir -p /mnt/xfs_demo
mount "$LOOPDEV" /mnt/xfs_demo
xfs_growfs /mnt/xfs_demo   # no-op here since the loop device itself isn't bigger

umount /mnt/xfs_demo
losetup -d "$LOOPDEV"
rm -f /tmp/xfs.img
