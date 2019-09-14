#!/usr/bin/env bash
# Run: sh fs_01_overview.sh
# What this step adds: identifying mounted filesystem types.
# Step 1: overview

# Step 1: what filesystem types the running kernel supports
cat /proc/filesystems

# Step 1: mounted filesystems and their type
df -hT

# Step 1: same info from /proc/mounts
cat /proc/mounts | column -t
