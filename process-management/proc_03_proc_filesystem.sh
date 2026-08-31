#!/usr/bin/env bash
# Run: sh proc_03_proc_filesystem.sh
# What this step adds: reading process info directly from /proc.
# Step 3: /proc filesystem

sleep 60 & PID=$!

# Step 3: human-readable status: state, memory, threads
cat /proc/$PID/status | head -10

# Step 3: the exact command line it was started with
cat /proc/$PID/cmdline | tr '\0' ' '; echo

# Step 3: open file descriptors
ls -la /proc/$PID/fd

# Step 3: current working directory and environment
readlink /proc/$PID/cwd
cat /proc/$PID/environ | tr '\0' '\n' | head -3

kill "$PID"
