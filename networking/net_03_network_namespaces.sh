#!/usr/bin/env bash
# Run: sh net_03_network_namespaces.sh (needs root)
# What this step adds: isolated network stacks via ip netns.
# Step 3: network namespaces

ip route show

# Step 3: create a namespace — it starts with only loopback
ip netns add demo_ns
ip netns exec demo_ns ip addr show

# Step 3: bring up loopback inside it (not automatic)
ip netns exec demo_ns ip link set lo up
ip netns exec demo_ns ping -c1 127.0.0.1

# Step 3: run any command inside the namespace's network stack
ip netns exec demo_ns ip route show   # empty — no routes yet

ip netns delete demo_ns
