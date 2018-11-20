#!/usr/bin/env sh
# Run: sh apk_03_repositories.sh (on Alpine)
# What this step adds: repository config and refreshing the package index.
# Step 3: apk update / /etc/apk/repositories

apk add curl
apk del curl
apk upgrade
apk search curl
apk info curl

# Step 3: repositories are listed one per line here
cat /etc/apk/repositories

# Step 3: refresh the local package index from configured repositories
apk update

# Step 3: temporarily enable the community repo for one install
apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community htop

# Step 3: enable edge/testing for bleeding-edge packages (not for prod)
# echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
