#!/usr/bin/env bash
# Run: sh fs_02_ext4_basics.sh (needs root + a spare block device/loop file)
# What this step adds: creating and inspecting an ext4 filesystem.
# Step 2: ext4 basics

cat /proc/filesystems | grep ext4
df -hT

# Step 2: build a throwaway loop device to format instead of a real disk
dd if=/dev/zero of=/tmp/ext4.img bs=1M count=100
losetup -fP /tmp/ext4.img
LOOPDEV=$(losetup -j /tmp/ext4.img | cut -d: -f1)

# Step 2: create the filesystem
mkfs.ext4 "$LOOPDEV"

# Step 2: inspect it
tune2fs -l "$LOOPDEV" | head -15
fsck.ext4 -n "$LOOPDEV"

losetup -d "$LOOPDEV"
rm -f /tmp/ext4.img
