#!/usr/bin/env bash
# Run: sh ns_03_net_namespace.sh (needs root)
# What this step adds: network namespaces — a separate network stack.
# Step 3: network namespace

unshare --pid --fork --mount-proc bash -c 'echo "inside PID: $$"'

# Step 3: a fresh net namespace starts with only loopback, no default route
unshare --net bash -c 'ip addr show; ip route show'

# Step 3: named namespaces (managed via `ip netns`) persist and are easier
# to reference from multiple commands than an anonymous `unshare --net`
ip netns add demo_ns
ip netns exec demo_ns ip addr show
ip netns list
ip netns delete demo_ns
