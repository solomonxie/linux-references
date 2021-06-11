#!/usr/bin/env bash
# Run: sh perm_03_suid_sgid_sticky.sh (needs root)
# What this step adds: SUID, SGID, and the sticky bit.
# Step 3: SUID / SGID / sticky bit

touch /tmp/perm_demo.txt
chmod 640 /tmp/perm_demo.txt

# Step 3: SUID — runs as the file's owner, not the invoking user (classic example: passwd)
ls -l /usr/bin/passwd

# Step 3: setting it yourself
cp /bin/ls /tmp/ls_copy
chmod u+s /tmp/ls_copy
ls -l /tmp/ls_copy   # note the 's' in the owner exec bit

# Step 3: SGID on a directory — new files inherit the directory's group
mkdir -p /tmp/sgid_demo
chmod g+s /tmp/sgid_demo
ls -ld /tmp/sgid_demo

# Step 3: sticky bit on a directory — only the file's owner can delete it,
# even with group/other write access (classic example: /tmp itself)
chmod +t /tmp/sgid_demo
ls -ld /tmp/sgid_demo

rm -f /tmp/perm_demo.txt /tmp/ls_copy
rm -rf /tmp/sgid_demo
