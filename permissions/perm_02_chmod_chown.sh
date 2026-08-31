#!/usr/bin/env bash
# Run: sh perm_02_chmod_chown.sh
# What this step adds: changing file mode and ownership.
# Step 2: chmod / chown

groupadd demo_group 2>/dev/null
useradd -m -g demo_group demo_user 2>/dev/null

touch /tmp/perm_demo.txt

# Step 2: symbolic vs octal chmod — equivalent results
chmod u+rw,g+r,o-rwx /tmp/perm_demo.txt
chmod 640 /tmp/perm_demo.txt
ls -l /tmp/perm_demo.txt

# Step 2: change owner and/or group
chown demo_user /tmp/perm_demo.txt
chown demo_user:demo_group /tmp/perm_demo.txt
chgrp demo_group /tmp/perm_demo.txt
ls -l /tmp/perm_demo.txt

rm -f /tmp/perm_demo.txt
userdel -r demo_user 2>/dev/null
groupdel demo_group 2>/dev/null
