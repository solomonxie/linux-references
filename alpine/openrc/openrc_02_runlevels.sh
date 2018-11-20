#!/usr/bin/env sh
# Run: sh openrc_02_runlevels.sh (on Alpine)
# What this step adds: enabling services to start automatically at boot.
# Step 2: rc-update / runlevels

rc-service sshd start
rc-status -a

# Step 2: add a service to the default runlevel (boots with the system)
rc-update add sshd default

# Step 2: list what's enabled in each runlevel
rc-update show

# Step 2: remove it from a runlevel (won't autostart, can still be run manually)
rc-update del sshd default

# Step 2: common runlevels: sysinit, boot, default, shutdown
