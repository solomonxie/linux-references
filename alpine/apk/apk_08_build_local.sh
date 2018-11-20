#!/usr/bin/env sh
# Run: sh apk_08_build_local.sh (on Alpine)
# What this step adds: advanced — building an .apk package locally with abuild.
# Step 8: abuild

apk add alpine-sdk
adduser -D builder && addgroup builder abuild
su builder -c '
  cd ~
  mkdir myapp && cd myapp
  abuild-keygen -a -i          # Step 8: generate a signing key for local builds
  # write an APKBUILD describing pkgname/pkgver/source/build()/package()
  abuild -r                    # Step 8: build the package, resolving deps as needed
'
# Step 8: install what abuild -r just produced
apk add --allow-untrusted ~builder/packages/myapp/*/myapp-*.apk
