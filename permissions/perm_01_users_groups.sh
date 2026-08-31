#!/usr/bin/env bash
# Run: sh perm_01_users_groups.sh (needs root)
# What this step adds: creating and inspecting users and groups.
# Step 1: users / groups

# Step 1: where users/groups live
head -3 /etc/passwd
head -3 /etc/group

# Step 1: create a group, then a user in it
groupadd demo_group
useradd -m -g demo_group demo_user

# Step 1: inspect what was created
id demo_user
getent passwd demo_user

userdel -r demo_user
groupdel demo_group
