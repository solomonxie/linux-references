#!/usr/bin/env bash
# Run: sh net_01_ip_basics.sh
# What this step adds: iproute2 basics — addresses and links.
# Step 1: ip addr / ip link

# Step 1: list network interfaces
ip link show

# Step 1: list addresses on all interfaces
ip addr show

# Step 1: bring an interface up/down (needs a real/dummy interface + root)
# ip link set eth0 up
# ip link set eth0 down

# Step 1: add/remove an address on an interface
# ip addr add 192.168.100.10/24 dev eth0
# ip addr del 192.168.100.10/24 dev eth0
