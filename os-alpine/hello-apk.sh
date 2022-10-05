#!/usr/bin/env sh
# apk (Alpine Package Keeper) — common usage, one section per topic, basic to advanced.
# Run: sh apk.sh (on Alpine)

# ----- 1. install / remove / upgrade -----
apk add curl          # install a package
apk add curl vim      # install multiple
apk del curl          # remove a package
apk upgrade           # upgrade all installed packages
apk upgrade curl      # upgrade a single package

# ----- 2. search / info -----
apk search curl
apk info curl
apk info -L curl                       # list files a package installs
apk info --who-owns /usr/bin/curl      # which package owns a given file

# ----- 3. repositories -----
cat /etc/apk/repositories               # one repo per line
apk update                              # refresh the local package index
apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community htop
# echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# ----- 4. virtual packages -----
# group disposable build deps so one `apk del` removes them all (common in Dockerfiles)
apk add --virtual .build-deps gcc musl-dev make
# ... compile something here ...
apk del .build-deps

# ----- 5. cache -----
apk add --no-cache curl                 # skip the local cache (smaller Docker layers)
apk cache download                      # cache everything /etc/apk/world needs
apk cache clean                         # remove cached packages no longer needed
# apk add --cache-max-age 0 curl        # install using only what's already cached

# ----- 6. fix / verify -----
apk fix                                 # reinstall/repair packages with missing files
apk verify curl                         # verify checksums against the index
apk fix --reinstall curl                # reinstall a specific package from scratch

# ----- 7. world / version pinning -----
cat /etc/apk/world                      # top-level requested packages, one per line
apk add "curl=8.5.0-r0"                 # pin an exact version
apk info | head -5

# ----- 8. build a local package (advanced) -----
apk add alpine-sdk
adduser -D builder && addgroup builder abuild
su builder -c '
  cd ~
  mkdir myapp && cd myapp
  abuild-keygen -a -i          # generate a signing key for local builds
  # write an APKBUILD describing pkgname/pkgver/source/build()/package()
  abuild -r                    # build the package, resolving deps as needed
'
apk add --allow-untrusted ~builder/packages/myapp/*/myapp-*.apk

# ----- 9. custom repository (advanced) -----
# an apk repo is just a directory tree + an APKINDEX, served over HTTP
mkdir -p /srv/myrepo/x86_64
cp ~builder/packages/myapp/x86_64/*.apk /srv/myrepo/x86_64/
cd /srv/myrepo/x86_64 && apk index -o APKINDEX.tar.gz *.apk
abuild-sign APKINDEX.tar.gz             # sign the index with your abuild key
# serve it, e.g.: (cd /srv/myrepo && python3 -m http.server 8080)

# consume it from a client — add the key, then the repo URL
# cp myrepo.rsa.pub /etc/apk/keys/
echo "http://myrepo.local:8080" >> /etc/apk/repositories
apk update
apk add myapp
