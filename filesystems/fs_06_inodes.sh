#!/usr/bin/env bash
# Run: sh fs_06_inodes.sh
# What this step adds: what inodes are and how to inspect them.
# Step 6: inodes

# Step 6: inode usage per filesystem (can run out even with free disk space)
df -i

# Step 6: a file's inode number and metadata
touch /tmp/inode_demo.txt
ls -i /tmp/inode_demo.txt
stat /tmp/inode_demo.txt

# Step 6: two hardlinks share one inode — same data, two directory entries
ln /tmp/inode_demo.txt /tmp/inode_demo_hardlink.txt
ls -i /tmp/inode_demo.txt /tmp/inode_demo_hardlink.txt

rm -f /tmp/inode_demo.txt /tmp/inode_demo_hardlink.txt
