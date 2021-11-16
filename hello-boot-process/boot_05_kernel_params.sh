#!/usr/bin/env bash
# Run: sh boot_05_kernel_params.sh
# What this step adds: kernel boot parameters and where they come from.
# Step 5: kernel parameters

lsinitrd 2>/dev/null | head -3

# Step 5: the exact parameters the running kernel was booted with
cat /proc/cmdline

# Step 5: these come from the `linux` line GRUB passes, e.g.:
#   linux /vmlinuz-... root=UUID=... ro quiet splash

# Step 5: common parameters worth recognizing
#   root=...       which device/UUID has the root filesystem
#   ro / rw        mount root read-only or read-write initially
#   quiet          suppress most boot messages
#   single / 1     boot straight to single-user/rescue mode
#   init=/bin/sh   skip normal init entirely (rescue technique)

# Step 5: some params are also readable live per-subsystem under sysctl
sysctl -a 2>/dev/null | grep -m1 kernel.osrelease
