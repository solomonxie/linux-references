#!/usr/bin/env sh
# Run: sh busybox_01_overview.sh (on Alpine)
# What this step adds: what BusyBox is, and listing its applets.
# Step 1: overview / busybox --list

# Step 1: one binary implements dozens of common Unix tools
busybox --list | head -20

# Step 1: ls, cat, grep, etc. on Alpine are usually all BusyBox underneath
ls -la /bin/ls /bin/cat /bin/grep

# Step 1: run an applet explicitly through the busybox binary
busybox ls -la /tmp
