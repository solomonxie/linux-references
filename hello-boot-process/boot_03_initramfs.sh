#!/usr/bin/env bash
# Run: sh boot_03_initramfs.sh (needs root; tools vary by distro: dracut vs mkinitfs vs update-initramfs)
# What this step adds: what's inside the initramfs and how it's built.
# Step 3: initramfs

cat /etc/default/grub 2>/dev/null | head -3

# Step 3: the initramfs is a small early-boot filesystem with just enough
# to find and mount the real root (disk drivers, LVM/crypto tools, etc.)
ls -la /boot/initr* 2>/dev/null

# Step 3: list what's packed inside it (dracut-based distros)
lsinitrd 2>/dev/null | head -20

# Step 3: what modules/drivers dracut would include (without rebuilding)
dracut --list-modules 2>/dev/null | head -10

# Step 3: rebuild it after e.g. adding a driver needed to find the root disk
# dracut --force            # dracut-based (Fedora/RHEL)
# update-initramfs -u        # Debian/Ubuntu
# mkinitfs                   # Alpine
