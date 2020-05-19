#!/usr/bin/env bash
# Run: sh fs_05_mount_options.sh (needs root)
# What this step adds: common mount options and remounting.
# Step 5: mount options

df -hT

# Step 5: mount read-only
# mount -o ro /dev/sdX1 /mnt/point

# Step 5: mount without updating access times (perf win on busy filesystems)
# mount -o noatime /dev/sdX1 /mnt/point

# Step 5: remount an already-mounted filesystem with new options, no downtime
# mount -o remount,rw /mnt/point

# Step 5: see what options a mount is actually using
findmnt /mnt/point 2>/dev/null || echo "nothing mounted there"

# Step 5: common options at a glance:
#   ro/rw        read-only / read-write
#   noatime      skip access-time updates
#   nosuid       ignore SUID/SGID bits on this filesystem
#   noexec       disallow executing binaries from this filesystem
