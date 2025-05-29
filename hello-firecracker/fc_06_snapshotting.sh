#!/usr/bin/env bash
# Run: sh fc_06_snapshotting.sh (continues step 3's running microVM)
# What this step adds: pause/resume and snapshot/restore -- the core trick
# behind serverless "warm start" performance: boot once, snapshot, then
# restore that snapshot in a few milliseconds for every new invocation
# instead of re-booting a kernel each time.
# Step 6: snapshotting

api() { curl -s --unix-socket fc.sock -X "$1" "http://localhost/$2" -H 'Content-Type: application/json' -d "$3"; }

# Step 6: pause the vCPUs before snapshotting (guest state must be frozen)
api PATCH vm '{"state": "Paused"}'

# Step 6: write memory + device state to disk
api PUT snapshot/create '{
  "snapshot_path": "snap_file",
  "mem_file_path": "mem_file",
  "version": "1.10.0"
}'

kill "$FC_PID" 2>/dev/null

# Step 6: restoring -- boot a *new* Firecracker process directly from the
# snapshot instead of from boot-source/drives; this is what makes it fast
firecracker --api-sock fc2.sock &
FC2_PID=$!
sleep 0.3
curl -s --unix-socket fc2.sock -X PUT 'http://localhost/snapshot/load' \
  -H 'Content-Type: application/json' \
  -d '{"snapshot_path": "snap_file", "mem_file_path": "mem_file", "resume_vm": true}'

kill "$FC2_PID" 2>/dev/null
