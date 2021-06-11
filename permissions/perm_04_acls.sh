#!/usr/bin/env bash
# Run: sh perm_04_acls.sh (needs a filesystem mounted with acl support)
# What this step adds: ACLs — per-user/group permissions beyond owner/group/other.
# Step 4: ACLs

touch /tmp/acl_demo.txt
chmod 640 /tmp/acl_demo.txt
ls -l /tmp/acl_demo.txt

# Step 4: grant a specific extra user read+write, without changing the owner/group
setfacl -m u:demo_user:rw /tmp/acl_demo.txt

# Step 4: view the ACL (ls -l alone only shows a trailing '+' hint)
getfacl /tmp/acl_demo.txt

# Step 4: remove one entry, or wipe all ACL entries back to the base permissions
setfacl -x u:demo_user /tmp/acl_demo.txt
setfacl -b /tmp/acl_demo.txt

rm -f /tmp/acl_demo.txt
