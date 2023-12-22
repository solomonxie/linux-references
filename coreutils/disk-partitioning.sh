#!/usr/bin/env bash
# Disk partitioning walkthrough — fdisk, parted, mkfs/mount, LVM, online resize.
# One section per topic, basic to advanced. Needs root + a spare block device/loop file.
# Run: sh disk-partitioning.sh

# ----- 1. fdisk basics (MBR) -----
fdisk -l

# build a throwaway disk image to partition instead of real hardware
dd if=/dev/zero of=/tmp/disk1.img bs=1M count=200
losetup -fP /tmp/disk1.img
LOOPDEV=$(losetup -j /tmp/disk1.img | cut -d: -f1)

# fdisk is interactive; script it with a heredoc of keystrokes
# n(new) p(primary) 1(number) enter(default start) +100M(size) w(write)
printf 'n\np\n1\n\n+100M\nw\n' | fdisk "$LOOPDEV"

fdisk -l "$LOOPDEV"
losetup -d "$LOOPDEV"
rm -f /tmp/disk1.img

# ----- 2. parted basics (GPT) -----
fdisk -l

dd if=/dev/zero of=/tmp/disk2.img bs=1M count=200
losetup -fP /tmp/disk2.img
LOOPDEV=$(losetup -j /tmp/disk2.img | cut -d: -f1)

# GPT label, then one partition — parted takes commands as flags,
# no interactive heredoc needed like fdisk
parted -s "$LOOPDEV" mklabel gpt
parted -s "$LOOPDEV" mkpart primary ext4 1MiB 100MiB

parted -s "$LOOPDEV" print

losetup -d "$LOOPDEV"
rm -f /tmp/disk2.img

# ----- 3. mkfs + mount -----
dd if=/dev/zero of=/tmp/disk3.img bs=1M count=200
losetup -fP /tmp/disk3.img
LOOPDEV=$(losetup -j /tmp/disk3.img | cut -d: -f1)
parted -s "$LOOPDEV" mklabel gpt
parted -s "$LOOPDEV" mkpart primary ext4 1MiB 100MiB
partprobe "$LOOPDEV"   # re-read the partition table so ${LOOPDEV}p1 shows up

# format the new partition
mkfs.ext4 "${LOOPDEV}p1"

# mount it and confirm
mkdir -p /mnt/disk_demo
mount "${LOOPDEV}p1" /mnt/disk_demo
df -h /mnt/disk_demo
echo "hello" > /mnt/disk_demo/test.txt

umount /mnt/disk_demo
losetup -d "$LOOPDEV"
rm -f /tmp/disk3.img

# ----- 4. LVM: pv / vg / lv -----
dd if=/dev/zero of=/tmp/disk4.img bs=1M count=300
losetup -fP /tmp/disk4.img
LOOPDEV=$(losetup -j /tmp/disk4.img | cut -d: -f1)

# physical volume = a disk/partition LVM can use
pvcreate "$LOOPDEV"
pvdisplay "$LOOPDEV"

# volume group = a pool combining one or more physical volumes
vgcreate disk_demo_vg "$LOOPDEV"
vgdisplay disk_demo_vg

# logical volume = a slice of the pool you actually format/mount
lvcreate -L 100M -n disk_demo_lv disk_demo_vg
lvdisplay /dev/disk_demo_vg/disk_demo_lv

vgremove -f disk_demo_vg
pvremove "$LOOPDEV"
losetup -d "$LOOPDEV"
rm -f /tmp/disk4.img

# ----- 5. online resize (advanced) -----
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

# grow the logical volume using free space still in the vg,
# then grow the ext4 filesystem to fill it — both while it's mounted
lvextend -L +200M /dev/disk_demo_vg/disk_demo_lv
resize2fs /dev/disk_demo_vg/disk_demo_lv

df -h /mnt/disk_demo

# xfs uses xfs_growfs instead of resize2fs (see filesystems/fs_03_xfs_basics.sh);
# shrinking is far riskier and ext4-only — always back up first, xfs can't shrink at all

umount /mnt/disk_demo
lvremove -f disk_demo_vg/disk_demo_lv
vgremove -f disk_demo_vg
pvremove "$LOOPDEV"
losetup -d "$LOOPDEV"
rm -f /tmp/disk5.img
