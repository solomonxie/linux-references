#!/usr/bin/env bash
# Run: sh boot_03_grub.sh (needs root; some paths are distro-specific)
# What this step adds: inspecting and regenerating GRUB's config.
# Step 3: GRUB

efibootmgr -v 2>/dev/null

# Step 3: GRUB's generated config (don't hand-edit this — edit the sources below)
cat /boot/grub/grub.cfg 2>/dev/null | head -20

# Step 3: the human-edited defaults GRUB reads when regenerating
cat /etc/default/grub 2>/dev/null

# Step 3: per-distro drop-in scripts that build the menu (kernel list, etc.)
ls /etc/grub.d/ 2>/dev/null

# Step 3: regenerate grub.cfg after changing /etc/default/grub or /etc/grub.d
# grub-mkconfig -o /boot/grub/grub.cfg

# Step 3: GRUB works the same way on UEFI and legacy BIOS — on UEFI it's
# installed as an .efi binary on the ESP (see step 2); on BIOS it's embedded
# via the MBR/stage1.5. Alternatives worth knowing: systemd-boot (UEFI-only,
# no scripting, just picks a pre-built kernel entry) and syslinux (BIOS-only,
# common on USB/PXE installers).
