#!/usr/bin/env bash
# Run: sh disk_02_parted_basics.sh (needs root + a spare block device/loop file)
# What this step adds: GPT partitioning with parted (scriptable, non-interactive).
# Step 2: parted basics

fdisk -l

dd if=/dev/zero of=/tmp/disk2.img bs=1M count=200
losetup -fP /tmp/disk2.img
LOOPDEV=$(losetup -j /tmp/disk2.img | cut -d: -f1)

# Step 2: GPT label, then one partition — parted takes commands as flags,
# no interactive heredoc needed like fdisk
parted -s "$LOOPDEV" mklabel gpt
parted -s "$LOOPDEV" mkpart primary ext4 1MiB 100MiB

parted -s "$LOOPDEV" print

losetup -d "$LOOPDEV"
rm -f /tmp/disk2.img
