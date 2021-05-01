#!/usr/bin/env bash
# Run: sh disk_01_fdisk_basics.sh (needs root + a spare block device/loop file)
# What this step adds: MBR partitioning with fdisk.
# Step 1: fdisk basics

# Step 1: list all disks and their existing partitions
fdisk -l

# Step 1: build a throwaway disk image to partition instead of real hardware
dd if=/dev/zero of=/tmp/disk1.img bs=1M count=200
losetup -fP /tmp/disk1.img
LOOPDEV=$(losetup -j /tmp/disk1.img | cut -d: -f1)

# Step 1: fdisk is interactive; script it with a heredoc of keystrokes
# n(new) p(primary) 1(number) enter(default start) +100M(size) w(write)
printf 'n\np\n1\n\n+100M\nw\n' | fdisk "$LOOPDEV"

fdisk -l "$LOOPDEV"
losetup -d "$LOOPDEV"
rm -f /tmp/disk1.img
