#!/usr/bin/env sh
# Run: sh apk_09_custom_repo.sh (on Alpine)
# What this step adds: advanced — hosting and consuming a private apk repo.
# Step 9: custom repository

# Step 9: an apk repo is just a directory tree + an APKINDEX, served over HTTP
mkdir -p /srv/myrepo/x86_64
cp ~builder/packages/myapp/x86_64/*.apk /srv/myrepo/x86_64/
cd /srv/myrepo/x86_64 && apk index -o APKINDEX.tar.gz *.apk
abuild-sign APKINDEX.tar.gz     # Step 9: sign the index with your abuild key

# serve it, e.g.: (cd /srv/myrepo && python3 -m http.server 8080)

# Step 9: consume it from a client — add the key, then the repo URL
# cp myrepo.rsa.pub /etc/apk/keys/
echo "http://myrepo.local:8080" >> /etc/apk/repositories
apk update
apk add myapp
