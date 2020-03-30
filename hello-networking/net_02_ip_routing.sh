#!/usr/bin/env bash
# Run: sh net_02_ip_routing.sh (needs root to modify routes)
# What this step adds: inspecting and changing the routing table.
# Step 2: ip route

ip link show
ip addr show

# Step 2: current routing table
ip route show

# Step 2: which route a destination would take, without sending anything
ip route get 8.8.8.8

# Step 2: add/remove a static route
# ip route add 10.0.0.0/24 via 192.168.1.1
# ip route del 10.0.0.0/24

# Step 2: default gateway specifically
ip route show default
