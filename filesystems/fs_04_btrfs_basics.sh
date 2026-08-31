#!/usr/bin/env bash
# Run: sh fs_04_btrfs_basics.sh (needs root + a spare block device/loop file)
# What this step adds: btrfs subvolumes and snapshots.
# Step 4: btrfs basics

dd if=/dev/zero of=/tmp/btrfs.img bs=1M count=300
losetup -fP /tmp/btrfs.img
LOOPDEV=$(losetup -j /tmp/btrfs.img | cut -d: -f1)

mkfs.btrfs "$LOOPDEV"
mkdir -p /mnt/btrfs_demo
mount "$LOOPDEV" /mnt/btrfs_demo

# Step 4: subvolumes — independently mountable/snapshottable trees
btrfs subvolume create /mnt/btrfs_demo/data
echo "hello" > /mnt/btrfs_demo/data/file.txt

# Step 4: snapshot — a cheap copy-on-write clone of the subvolume
btrfs subvolume snapshot /mnt/btrfs_demo/data /mnt/btrfs_demo/data_snapshot
btrfs subvolume list /mnt/btrfs_demo

umount /mnt/btrfs_demo
losetup -d "$LOOPDEV"
rm -f /tmp/btrfs.img
