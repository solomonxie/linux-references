#!/usr/bin/env sh
# Run: sh musl_04_gcompat.sh (on Alpine)
# What this step adds: gcompat, a shim for running unmodified glibc binaries.
# Step 4: gcompat

# Step 4: without gcompat, a glibc-linked binary fails immediately —
# there's no /lib64/ld-linux-x86-64.so.2 on Alpine to load it
# ./some-glibc-binary   # -> "not found" / exec format errors

apk add gcompat

# Step 4: gcompat provides a compatible loader + shims for common glibc symbols
ls /lib/ld-linux-x86-64.so.2 2>/dev/null   # now present, symlinked by gcompat

# Step 4: still not a full glibc — complex binaries (many syscalls, NSS
# plugins, locale data) may still fail; gcompat covers common cases only
