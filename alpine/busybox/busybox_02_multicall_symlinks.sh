#!/usr/bin/env sh
# Run: sh busybox_02_multicall_symlinks.sh (on Alpine)
# What this step adds: how the symlink-based multi-call binary trick works.
# Step 2: multi-call symlinks

busybox --list | head -5

# Step 2: /bin/ls is really just a symlink to busybox
ls -la /bin/ls

# Step 2: busybox looks at argv[0] to decide which applet to act as
cp /bin/busybox /tmp/mytool
ln -sf /tmp/mytool /tmp/ls-clone
/tmp/ls-clone -la /tmp   # behaves as `ls` because it was invoked as "ls-clone"...
# (real installs use the exact applet name, e.g. "ls", as the symlink name)

rm -f /tmp/mytool /tmp/ls-clone
