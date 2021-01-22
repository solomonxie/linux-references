#!/usr/bin/env bash
# Run: sh boot_01_overview.sh (reference notes; some commands need root/real hardware)
# What this step adds: the boot chain end to end.
# Step 1: overview

# Step 1: the chain — firmware -> bootloader -> kernel -> init
#   BIOS/UEFI  -> POST, picks a boot device
#   GRUB       -> loads the kernel + initramfs into memory
#   Linux kernel -> unpacks initramfs, mounts the real root filesystem
#   init (PID 1) -> systemd/OpenRC/sysvinit takes over, starts services

# Step 1: whether the system booted via UEFI or legacy BIOS
[ -d /sys/firmware/efi ] && echo "booted via UEFI" || echo "booted via legacy BIOS"

# Step 1: kernel messages from early boot, including hardware detection
dmesg | head -20
