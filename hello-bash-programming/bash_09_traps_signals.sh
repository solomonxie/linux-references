#!/usr/bin/env bash
# Run: bash bash_09_traps_signals.sh (Ctrl-C during the sleep to see the trap)
# What this step adds: trap — running cleanup on exit or a signal.
# Step 9: traps

name="World"
echo "hello, $name"

TMP_FILE=$(mktemp)
echo "scratch data" > "$TMP_FILE"

# Step 9: EXIT trap always runs, however the script ends — good for cleanup
cleanup() {
	echo "cleaning up $TMP_FILE"
	rm -f "$TMP_FILE"
}
trap cleanup EXIT

# Step 9: trap a specific signal to react before exiting
trap 'echo "interrupted!"; exit 1' INT

echo "sleeping 3s, press Ctrl-C to interrupt..."
sleep 3
echo "done sleeping normally"
