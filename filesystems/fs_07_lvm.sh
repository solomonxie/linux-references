#!/usr/bin/env bash
# Run: sh fs_07_lvm.sh (needs root + a spare block device/loop file)
# What this step adds: advanced — LVM physical/volume/logical volumes and resizing.
# Step 7: LVM

dd if=/dev/zero of=/tmp/lvm.img bs=1M count=500
losetup -fP /tmp/lvm.img
LOOPDEV=$(losetup -j /tmp/lvm.img | cut -d: -f1)

# Step 7: physical volume -> volume group -> logical volume
pvcreate "$LOOPDEV"
vgcreate demo_vg "$LOOPDEV"
lvcreate -L 200M -n demo_lv demo_vg

mkfs.ext4 /dev/demo_vg/demo_lv
mkdir -p /mnt/lvm_demo
mount /dev/demo_vg/demo_lv /mnt/lvm_demo

# Step 7: grow the logical volume, then the filesystem on top of it, online
lvextend -L +100M /dev/demo_vg/demo_lv
resize2fs /dev/demo_vg/demo_lv

umount /mnt/lvm_demo
lvremove -f demo_vg/demo_lv
vgremove demo_vg
pvremove "$LOOPDEV"
losetup -d "$LOOPDEV"
rm -f /tmp/lvm.img
