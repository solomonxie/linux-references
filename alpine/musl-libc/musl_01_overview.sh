#!/usr/bin/env sh
# Run: sh musl_01_overview.sh (on Alpine)
# What this step adds: identifying musl vs glibc on a binary/system.
# Step 1: musl vs glibc overview

# Step 1: Alpine's dynamic linker is musl's, not glibc's
ls -la /lib/ld-musl-*.so.1

# Step 1: check what libc a binary is linked against
file /bin/busybox
ldd /bin/busybox

# Step 1: glibc systems show /lib64/ld-linux-x86-64.so.2 instead — that
# loader is absent on Alpine, which is why glibc-built binaries fail here
