#!/usr/bin/env bash
# Run: sh boot_02_uefi_bios.sh (reference notes; some commands need root/real hardware)
# What this step adds: the two firmware boot paths in more depth — UEFI vs legacy BIOS.
# Step 2: UEFI and legacy BIOS

[ -d /sys/firmware/efi ] && echo "booted via UEFI" || echo "booted via legacy BIOS"

# Step 2: legacy BIOS — the MBR (first 512 bytes of the boot disk) has only
# 446 bytes for boot code, so it just chainloads a real bootloader (GRUB's
# stage1.5/stage2) rather than loading the kernel directly. Disks use an
# MBR partition table: max 4 primary partitions, ~2TiB size limit.

# Step 2: UEFI — firmware reads a FAT32 "EFI System Partition" (ESP)
# directly and executes a bootloader as a plain PE executable
# (e.g. /EFI/<distro>/grubx64.efi or /EFI/BOOT/bootx64.efi). No MBR
# chainloading step. Disks use GPT: many more partitions, no 2TiB limit.
findmnt /boot/efi 2>/dev/null || findmnt /efi 2>/dev/null || echo "ESP not mounted here"
ls /boot/efi/EFI 2>/dev/null

# Step 2: UEFI boot entries live in firmware NVRAM, not on disk — this is
# what "Boot0000, Boot0001, ..." and the boot order actually are
efibootmgr -v 2>/dev/null

# Step 2: adding/reordering entries (destructive — commented out)
# efibootmgr --create --disk /dev/sda --part 1 --label "My Linux" --loader /EFI/mydistro/grubx64.efi
# efibootmgr --bootorder 0001,0000

# Step 2: Secure Boot — UEFI-only, verifies the bootloader's signature
# before running it; legacy BIOS has no equivalent concept
mokutil --sb-state 2>/dev/null || echo "mokutil not installed / not UEFI"
