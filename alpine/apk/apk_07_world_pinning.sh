#!/usr/bin/env sh
# Run: sh apk_07_world_pinning.sh (on Alpine)
# What this step adds: /etc/apk/world, the file listing what you explicitly
# asked to have installed (as opposed to pulled in as a dependency).
# Step 7: world file / version pinning

apk add curl
apk update

# Step 7: world lists top-level requested packages, one per line
cat /etc/apk/world

# Step 7: pin an exact version (must match what's in the repo index)
apk add "curl=8.5.0-r0"

# Step 7: prevent a package from being upgraded past its current version
# (edit /etc/apk/world by hand to add a version constraint, e.g. curl<8.6)

# Step 7: show what's installed vs. what's only a dependency
apk info | head -5
