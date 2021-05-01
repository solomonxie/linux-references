#!/usr/bin/env bash
# Run: sh disk_05_resize_advanced.sh (needs root + a spare block device/loop file)
# What this step adds: advanced — growing an LVM volume and its filesystem online.
# Step 5: online resize

dd if=/dev/zero of=/tmp/disk5.img bs=1M count=500
losetup -fP /tmp/disk5.img
LOOPDEV=$(losetup -j /tmp/disk5.img | cut -d: -f1)
pvcreate "$LOOPDEV"
vgcreate disk_demo_vg "$LOOPDEV"
lvcreate -L 200M -n disk_demo_lv disk_demo_vg
mkfs.ext4 /dev/disk_demo_vg/disk_demo_lv
mkdir -p /mnt/disk_demo
mount /dev/disk_demo_vg/disk_demo_lv /mnt/disk_demo

df -h /mnt/disk_demo

# Step 5: grow the logical volume using free space still in the vg,
# then grow the ext4 filesystem to fill it — both while it's mounted
lvextend -L +200M /dev/disk_demo_vg/disk_demo_lv
resize2fs /dev/disk_demo_vg/disk_demo_lv

df -h /mnt/disk_demo

# Step 5: xfs uses xfs_growfs instead of resize2fs (see hello-filesystems/fs_03_xfs_basics.sh);
# shrinking is far riskier and ext4-only — always back up first, xfs can't shrink at all

umount /mnt/disk_demo
lvremove -f disk_demo_vg/disk_demo_lv
vgremove -f disk_demo_vg
pvremove "$LOOPDEV"
losetup -d "$LOOPDEV"
rm -f /tmp/disk5.img
