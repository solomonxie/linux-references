#!/usr/bin/env sh
# Run: sh apk_05_cache.sh (on Alpine)
# What this step adds: the local package cache and cache-only installs.
# Step 5: apk cache / --no-cache

apk add curl
apk del curl
apk update

# Step 5: skip populating the local cache (smaller Docker layers)
apk add --no-cache curl

# Step 5: point apk at a cache dir and keep downloaded packages there
# ln -s /var/cache/apk /etc/apk/cache
apk cache download   # download all packages needed to satisfy /etc/apk/world
apk cache clean       # remove cached packages no longer needed

# Step 5: install using only what's already cached, no network
# apk add --cache-max-age 0 curl
