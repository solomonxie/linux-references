#!/usr/bin/env bash
# Run: sh net_06_bridges_veth.sh (needs root)
# What this step adds: advanced — veth pairs + a bridge, the mechanism
# container runtimes use to connect a namespace to the outside network.
# Step 6: veth pairs + bridge

nft list ruleset 2>/dev/null

# Step 6: a veth pair is two ends of a virtual cable; one end goes into a
# namespace, the other stays on the host and joins a bridge
ip netns add demo_ns
ip link add veth-host type veth peer name veth-ns
ip link set veth-ns netns demo_ns

# Step 6: bridge on the host side — like a virtual switch
ip link add demo_br type bridge
ip link set veth-host master demo_br
ip link set demo_br up
ip link set veth-host up

# Step 6: addresses on each end, then bring the namespace side up
ip addr add 192.168.50.1/24 dev demo_br
ip netns exec demo_ns ip addr add 192.168.50.2/24 dev veth-ns
ip netns exec demo_ns ip link set veth-ns up
ip netns exec demo_ns ip link set lo up

# Step 6: now the namespace can reach the host across the bridge
ip netns exec demo_ns ping -c1 192.168.50.1

ip link delete demo_br
ip netns delete demo_ns
