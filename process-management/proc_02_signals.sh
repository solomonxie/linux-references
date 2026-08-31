#!/usr/bin/env bash
# Run: sh proc_02_signals.sh
# What this step adds: sending and trapping signals.
# Step 2: signals

ps aux | head -5

# Step 2: start a background process to signal
sleep 60 &
PID=$!

# Step 2: SIGTERM asks a process to exit gracefully (the default kill signal)
kill -TERM "$PID"
wait "$PID" 2>/dev/null

# Step 2: SIGKILL cannot be caught or ignored — a last resort
sleep 60 & PID=$!
kill -KILL "$PID"

# Step 2: trap lets a script react to a signal instead of dying immediately
trap 'echo "caught SIGINT, cleaning up"; exit 1' INT
echo "run with Ctrl-C within 3s to see the trap fire"
sleep 3 2>/dev/null
trap - INT
