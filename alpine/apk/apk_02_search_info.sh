#!/usr/bin/env sh
# Run: sh apk_02_search_info.sh (on Alpine)
# What this step adds: searching for packages and inspecting them.
# Step 2: apk search / apk info

apk add curl
apk del curl
apk upgrade

# Step 2: search the package index by name
apk search curl

# Step 2: show details of an installed or available package
apk info curl

# Step 2: list files a package installs
apk info -L curl

# Step 2: which package owns a given file
apk info --who-owns /usr/bin/curl
