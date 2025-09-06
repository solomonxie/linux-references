#!/usr/bin/env bash
# Run: sh net_07_gre_tunnel.sh (needs root)
# What this step adds: a GRE tunnel — encapsulating any IP traffic inside
# IP, the simplest building block behind most site-to-site tunneling setups.
# Step 7: GRE tunnel

# Step 7: simulate "two sites" with two network namespaces on a veth pair
# standing in for the public internet link between them
ip netns add site_a
ip netns add site_b
ip link add veth-a type veth peer name veth-b
ip link set veth-a netns site_a
ip link set veth-b netns site_b
ip netns exec site_a ip addr add 10.0.0.1/30 dev veth-a
ip netns exec site_b ip addr add 10.0.0.2/30 dev veth-b
ip netns exec site_a ip link set veth-a up
ip netns exec site_b ip link set veth-b up
ip netns exec site_a ip link set lo up
ip netns exec site_b ip link set lo up

# Step 7: a GRE tunnel over that "public" link — traffic on gre1 is
# transparently wrapped in an IP packet addressed to the other endpoint
ip netns exec site_a ip tunnel add gre1 mode gre remote 10.0.0.2 local 10.0.0.1 ttl 255
ip netns exec site_a ip addr add 192.168.100.1/30 dev gre1
ip netns exec site_a ip link set gre1 up

ip netns exec site_b ip tunnel add gre1 mode gre remote 10.0.0.1 local 10.0.0.2 ttl 255
ip netns exec site_b ip addr add 192.168.100.2/30 dev gre1
ip netns exec site_b ip link set gre1 up

# Step 7: site_a now reaches site_b's tunnel address as if directly connected
ip netns exec site_a ping -c1 192.168.100.2

ip netns delete site_a
ip netns delete site_b
