#!/usr/bin/env sh
# Run: sh apk_06_fix_verify.sh (on Alpine)
# What this step adds: repairing and verifying installed package integrity.
# Step 6: apk fix / apk verify

apk add curl
apk update

# Step 6: reinstall/repair packages with missing or modified files
apk fix

# Step 6: verify package checksums against the index, without changing anything
apk verify curl

# Step 6: reinstall a specific package from scratch
apk fix --reinstall curl
