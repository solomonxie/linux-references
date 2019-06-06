#!/usr/bin/env bash
# Run: sh systemd_01_unit_basics.sh (on a systemd distro)
# What this step adds: starting/stopping/checking a service unit.
# Step 1: systemctl start / stop / status

systemctl status sshd
systemctl start sshd
systemctl status sshd
systemctl restart sshd
systemctl stop sshd

# Step 1: list all loaded units
systemctl list-units --type=service | head -10
