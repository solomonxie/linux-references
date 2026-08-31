#!/usr/bin/env bash
# Common usage examples for: lsblk (Linux only)

# list all block devices as a tree
lsblk

# include filesystem type and mountpoint
lsblk -f

# show only device names, no headers (useful for scripting)
lsblk -nrdo NAME

# custom columns
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT

# show a single specific device
# lsblk /dev/sda
