#!/usr/bin/env sh
# Run: sh musl_03_dns_resolution.sh (on Alpine)
# What this step adds: musl's minimal getaddrinfo/DNS resolver quirks.
# Step 3: DNS resolution quirks

cat /etc/resolv.conf

# Step 3: musl's resolver is much simpler than glibc's nsswitch-based one —
# no /etc/nsswitch.conf support, no built-in mdns/nss plugin loading
apk add bind-tools
nslookup example.com

# Step 3: known gotcha — musl only reads the first 3 "nameserver" lines
# and has no DNS caching daemon; heavy repeated lookups hit the network
# every time (glibc-based distros often have nscd/systemd-resolved caching)

# Step 3: musl also has no support for /etc/hosts wildcard/glob entries
# that some glibc-based tools assume
