#!/usr/bin/env bash
# Run: sh boot_02_grub.sh (needs root; some paths are distro-specific)
# What this step adds: inspecting and regenerating GRUB's config.
# Step 2: GRUB

dmesg | head -3

# Step 2: GRUB's generated config (don't hand-edit this — edit the sources below)
cat /boot/grub/grub.cfg 2>/dev/null | head -20

# Step 2: the human-edited defaults GRUB reads when regenerating
cat /etc/default/grub 2>/dev/null

# Step 2: per-distro drop-in scripts that build the menu (kernel list, etc.)
ls /etc/grub.d/ 2>/dev/null

# Step 2: regenerate grub.cfg after changing /etc/default/grub or /etc/grub.d
# grub-mkconfig -o /boot/grub/grub.cfg
