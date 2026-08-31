#!/usr/bin/env bash
# Run: sh disk_03_mkfs_mount.sh (needs root + a spare block device/loop file)
# What this step adds: formatting a partition and mounting it.
# Step 3: mkfs + mount

dd if=/dev/zero of=/tmp/disk3.img bs=1M count=200
losetup -fP /tmp/disk3.img
LOOPDEV=$(losetup -j /tmp/disk3.img | cut -d: -f1)
parted -s "$LOOPDEV" mklabel gpt
parted -s "$LOOPDEV" mkpart primary ext4 1MiB 100MiB
partprobe "$LOOPDEV"   # re-read the partition table so ${LOOPDEV}p1 shows up

# Step 3: format the new partition
mkfs.ext4 "${LOOPDEV}p1"

# Step 3: mount it and confirm
mkdir -p /mnt/disk_demo
mount "${LOOPDEV}p1" /mnt/disk_demo
df -h /mnt/disk_demo
echo "hello" > /mnt/disk_demo/test.txt

umount /mnt/disk_demo
losetup -d "$LOOPDEV"
rm -f /tmp/disk3.img
