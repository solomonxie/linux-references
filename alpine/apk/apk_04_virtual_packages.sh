#!/usr/bin/env sh
# Run: sh apk_04_virtual_packages.sh (on Alpine)
# What this step adds: virtual packages — grouping disposable build deps
# so a single `apk del` removes all of them (common in Dockerfiles).
# Step 4: apk add --virtual

apk add curl
apk del curl
apk upgrade
apk update

# Step 4: tag a group of build-only deps under one virtual name
apk add --virtual .build-deps gcc musl-dev make

# ... compile something here ...

# Step 4: remove the whole group in one shot, keeping runtime deps clean
apk del .build-deps
