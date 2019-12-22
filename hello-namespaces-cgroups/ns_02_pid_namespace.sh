#!/usr/bin/env bash
# Run: sh ns_02_pid_namespace.sh (needs root)
# What this step adds: PID namespaces — the isolated process inside sees itself as PID 1.
# Step 2: PID namespace

ls -la /proc/$$/ns
unshare --uts --fork bash -c 'hostname ns2; hostname'

# Step 2: --pid isolates the PID tree; --mount-proc gives it its own /proc
# so `ps` inside actually reflects the namespace instead of the host's
unshare --pid --fork --mount-proc bash -c 'echo "inside PID: $$"; ps aux'

# Step 2: outside, that same process has an ordinary host-visible PID
echo "outside, this shell's PID: $$"
