#!/usr/bin/env bash
# Run: bash bash_12_advanced_debugging.sh
# What this step adds: advanced — debugging and defensive scripting flags.
# Step 12: debugging flags

diff <(echo a) <(echo a)

# Step 12: -e exits immediately on any unhandled non-zero exit code
# Step 12: -u errors on use of an unset variable instead of silently using ""
# Step 12: -o pipefail makes a pipeline fail if ANY stage fails, not just the last
set -euo pipefail

# Step 12: -x prints each command before running it — invaluable for debugging
set -x
value="hello"
echo "$value"
set +x   # turn tracing back off

# Step 12: trap ERR to react to any failing command under set -e
trap 'echo "failed at line $LINENO"' ERR

# Step 12: shellcheck (external tool) catches this kind of bug statically —
# run `shellcheck bash_12_advanced_debugging.sh` to see it in action
# unset_var_typo="oops"; echo "$unset_var_typoo"   # would fail under set -u
