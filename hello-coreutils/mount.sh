#!/usr/bin/env bash
# Common usage examples for: mount / umount

# list all currently mounted filesystems
mount

# same, more readable (Linux)
findmnt 2>/dev/null || mount | column -t

# mount a device to a mountpoint (requires root)
# mount /dev/sdb1 /mnt/data

# mount a specific filesystem type with options
# mount -t ext4 -o ro /dev/sdb1 /mnt/data

# bind-mount a directory to another path
# mount --bind /src/dir /dst/dir

# unmount
# umount /mnt/data
