#!/usr/bin/env bash
# Run: sh systemd_02_enable_targets.sh (on a systemd distro)
# What this step adds: enabling a service at boot, and targets (systemd's runlevels).
# Step 2: systemctl enable / targets

systemctl start sshd
systemctl status sshd

# Step 2: enable at boot (creates a symlink under the target's .wants/ dir)
systemctl enable sshd
systemctl is-enabled sshd
systemctl disable sshd

# Step 2: targets group units, roughly like SysV/OpenRC runlevels
systemctl get-default          # e.g. multi-user.target or graphical.target
systemctl list-units --type=target
