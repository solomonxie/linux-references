#!/usr/bin/env bash
# Run: sh proc_01_ps_top.sh
# What this step adds: inspecting running processes with ps and top.
# Step 1: ps / top basics

# Step 1: every process, full-format listing
ps aux | head -10

# Step 1: just this shell's process tree
ps --forest -o pid,ppid,cmd -g $(ps -o sid= -p $$) 2>/dev/null || ps aux | grep bash

# Step 1: one-shot snapshot instead of top's interactive refresh
top -b -n1 | head -15

# Step 1: htop is the friendlier interactive alternative, if installed
# htop
