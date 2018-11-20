#!/usr/bin/env sh
# Run: sh musl_06_build_from_source.sh (on Alpine)
# What this step adds: advanced — building third-party software against musl.
# Step 6: building from source against musl

apk add build-base   # gcc, make, musl-dev, and friends

# Step 6: common source-build friction points on musl:
# - code using glibc-only headers/macros (_GNU_SOURCE extensions)
# - code assuming `char` typedefs like `__u8` from glibc's <bits/*.h>
# - missing `execinfo.h` (backtrace()) — glibc-only, no musl equivalent
# - autotools scripts that `#include <error.h>` (glibc-only)

# Step 6: typical fix pattern — patch or configure around, don't fight the
# whole toolchain; many projects have --disable-* flags for optional
# glibc-specific features (e.g. --disable-nls, --disable-backtrace)

# Example: ./configure CC=cc --disable-nls && make && make install
