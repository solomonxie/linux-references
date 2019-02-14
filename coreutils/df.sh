#!/usr/bin/env bash
# Common usage examples for: df

# disk free space, human-readable
df -h

# specific filesystem/mount point
df -h /

# show filesystem type too
df -hT

# inode usage instead of block usage
df -i

# exclude tmpfs/devtmpfs noise (Linux)
df -h -x tmpfs -x devtmpfs 2>/dev/null || df -h
