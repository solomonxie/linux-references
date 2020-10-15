#!/usr/bin/env bash
# Run: sh perm_05_capabilities.sh (needs root)
# What this step adds: advanced — Linux capabilities, splitting up root's power.
# Step 5: capabilities

getfacl /tmp 2>/dev/null | head -3

# Step 5: instead of full SUID root, grant one specific privileged capability
cp /bin/ping /tmp/ping_copy 2>/dev/null

# Step 5: normally ping needs CAP_NET_RAW (traditionally via SUID root)
setcap cap_net_raw+ep /tmp/ping_copy

# Step 5: inspect what capabilities a binary carries
getcap /tmp/ping_copy

# Step 5: this is why containers often run "unprivileged" processes that
# still work — they're granted just the one capability they need, e.g.
# CAP_NET_BIND_SERVICE to bind port 80 without being root at all

setcap -r /tmp/ping_copy   # remove capabilities
rm -f /tmp/ping_copy
