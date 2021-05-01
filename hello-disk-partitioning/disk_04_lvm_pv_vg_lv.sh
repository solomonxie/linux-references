#!/usr/bin/env bash
# Run: sh disk_04_lvm_pv_vg_lv.sh (needs root + a spare block device/loop file)
# What this step adds: LVM on top of a raw partition — pv/vg/lv layering.
# Step 4: LVM pv/vg/lv

dd if=/dev/zero of=/tmp/disk4.img bs=1M count=300
losetup -fP /tmp/disk4.img
LOOPDEV=$(losetup -j /tmp/disk4.img | cut -d: -f1)

# Step 4: physical volume = a disk/partition LVM can use
pvcreate "$LOOPDEV"
pvdisplay "$LOOPDEV"

# Step 4: volume group = a pool combining one or more physical volumes
vgcreate disk_demo_vg "$LOOPDEV"
vgdisplay disk_demo_vg

# Step 4: logical volume = a slice of the pool you actually format/mount
lvcreate -L 100M -n disk_demo_lv disk_demo_vg
lvdisplay /dev/disk_demo_vg/disk_demo_lv

vgremove -f disk_demo_vg
pvremove "$LOOPDEV"
losetup -d "$LOOPDEV"
rm -f /tmp/disk4.img
