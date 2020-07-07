#!/usr/bin/env bash
# Run: sh proc_05_cgroup_scheduling.sh (needs root, cgroup v2)
# What this step adds: advanced — CPU scheduling via cgroup v2, beyond nice.
# Step 5: cgroup v2 scheduling

nice -n 10 sleep 1 &
wait

# Step 5: nice only works within one scheduling context; cgroups enforce
# hard/relative limits across whole groups of processes regardless of nice
mkdir -p /sys/fs/cgroup/demo_sched

# Step 5: relative share vs siblings (default 100, higher = more CPU share)
echo 50 > /sys/fs/cgroup/demo_sched/cpu.weight

# Step 5: hard cap — 20% of one CPU (20000us out of every 100000us period)
echo "20000 100000" > /sys/fs/cgroup/demo_sched/cpu.max

sleep 60 & echo $! > /sys/fs/cgroup/demo_sched/cgroup.procs
cat /sys/fs/cgroup/demo_sched/cpu.stat
kill %1 2>/dev/null

rmdir /sys/fs/cgroup/demo_sched
