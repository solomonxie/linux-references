#!/usr/bin/env bash
# Run: sh proc_04_nice_priority.sh
# What this step adds: scheduling priority — nice, renice, ionice.
# Step 4: nice / renice / ionice

sleep 60 & PID=$!
cat /proc/$PID/status | grep -i state

# Step 4: start a process with a lower CPU priority (higher niceness = nicer to others)
nice -n 10 sleep 60 &
NICE_PID=$!
ps -o pid,ni,cmd -p "$NICE_PID"

# Step 4: change priority of an already-running process
renice -n 5 -p "$PID"

# Step 4: I/O scheduling priority, independent of CPU nice
ionice -c2 -n7 -p "$PID"   # best-effort class, lowest priority within it

kill "$PID" "$NICE_PID" 2>/dev/null
