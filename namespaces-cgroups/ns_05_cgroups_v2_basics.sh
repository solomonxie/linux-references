#!/usr/bin/env bash
# Run: sh ns_05_cgroups_v2_basics.sh (needs root, cgroup v2 mounted at /sys/fs/cgroup)
# What this step adds: cgroup v2 — limiting resources for a group of processes.
# Step 5: cgroups v2 basics

mount -t tmpfs tmpfs /tmp/ns_demo 2>/dev/null; rmdir /tmp/ns_demo 2>/dev/null

# Step 5: confirm cgroup v2 (unified hierarchy) is mounted
mount | grep cgroup2
cat /sys/fs/cgroup/cgroup.controllers

# Step 5: create a cgroup — it's just a directory
mkdir -p /sys/fs/cgroup/demo_cg

# Step 5: cap memory and CPU for anything moved into it
echo "50M" > /sys/fs/cgroup/demo_cg/memory.max
echo "50000 100000" > /sys/fs/cgroup/demo_cg/cpu.max   # 50% of one CPU

# Step 5: move a process into the cgroup by PID
sleep 60 & echo $! > /sys/fs/cgroup/demo_cg/cgroup.procs
cat /sys/fs/cgroup/demo_cg/cgroup.procs
kill %1 2>/dev/null

rmdir /sys/fs/cgroup/demo_cg
