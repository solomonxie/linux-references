#!/usr/bin/env bash
# Run: sh boot_06_init_systems.sh (reference notes, not meant to fully execute)
# What this step adds: advanced — comparing what runs as PID 1.
# Step 6: init systems as PID 1

cat /proc/cmdline

# Step 6: whatever the kernel hands off to as PID 1 defines "init"
ps -p 1 -o pid,comm

# Step 6: three common choices, same job (bring the system to a usable
# state, then supervise services), different designs:
#   sysvinit  — sequential /etc/init.d scripts run by rc, oldest model
#   OpenRC    — dependency-aware script runner over the same kind of
#               /etc/init.d scripts (see os-alpine/hello-openrc.sh)
#   systemd   — a single long-running daemon, unit files instead of
#               scripts, native cgroup-per-service tracking (see systemd/)

# Step 6: you can point the kernel at a different init for rescue purposes
# by appending init=/bin/sh to the kernel command line (see step 5) — this
# skips PID 1 entirely and drops you straight into a shell
