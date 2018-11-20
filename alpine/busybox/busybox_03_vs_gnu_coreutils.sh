#!/usr/bin/env sh
# Run: sh busybox_03_vs_gnu_coreutils.sh (on Alpine)
# What this step adds: flags/behavior that differ from GNU coreutils.
# Step 3: BusyBox vs GNU coreutils differences

busybox ls -la /tmp

# Step 3: BusyBox implements a subset of flags — GNU-only flags just error
# ls --color=auto /tmp        # GNU-only long flag, unsupported by busybox ls
ls -la --color=auto /tmp 2>&1 | head -2 || true

# Step 3: sed here is busybox sed — no -i '' quirk like BSD, but also no
# GNU extensions like `s///g3` (replace from the 3rd match on)

# Step 3: `find` here lacks GNU find's -printf; use -exec / busybox stat instead
find /tmp -maxdepth 1 -type f 2>/dev/null | head -3

# Step 3: date lacks GNU's `date -d "1 day ago"`; busybox date takes -D fmt + -d value
date -D '%Y-%m-%d' -d '2024-01-01' 2>/dev/null || echo "busybox date syntax differs from GNU"
