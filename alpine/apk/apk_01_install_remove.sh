#!/usr/bin/env sh
# Run: sh apk_01_install_remove.sh (on Alpine)
# What this step adds: installing, removing, and upgrading packages.
# Step 1: apk add / apk del / apk upgrade

apk add curl          # install a package
apk add curl vim      # install multiple
apk del curl          # remove a package
apk upgrade           # upgrade all installed packages
apk upgrade curl      # upgrade a single package
