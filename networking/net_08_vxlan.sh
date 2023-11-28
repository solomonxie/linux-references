#!/usr/bin/env bash
# Run: sh net_08_vxlan.sh (needs root)
# What this step adds: VXLAN — tunneling a whole Layer 2 (Ethernet) segment
# inside UDP, the overlay mechanism behind most cloud/datacenter and
# container networking (Docker's overlay driver, Kubernetes CNIs).
# Step 8: VXLAN

ip netns add vx_a
ip netns add vx_b
ip link add veth-a type veth peer name veth-b
ip link set veth-a netns vx_a
ip link set veth-b netns vx_b
ip netns exec vx_a ip addr add 10.0.0.1/30 dev veth-a
ip netns exec vx_b ip addr add 10.0.0.2/30 dev veth-b
ip netns exec vx_a ip link set veth-a up
ip netns exec vx_b ip link set veth-b up
ip netns exec vx_a ip link set lo up
ip netns exec vx_b ip link set lo up

# Step 8: id 100 is the VNI (virtual network identifier) — the tag that
# keeps different tenants' overlays apart even though they share the same
# underlay network
ip netns exec vx_a ip link add vxlan100 type vxlan id 100 remote 10.0.0.2 dstport 4789 dev veth-a
ip netns exec vx_a ip addr add 172.20.0.1/24 dev vxlan100
ip netns exec vx_a ip link set vxlan100 up

ip netns exec vx_b ip link add vxlan100 type vxlan id 100 remote 10.0.0.1 dstport 4789 dev veth-b
ip netns exec vx_b ip addr add 172.20.0.2/24 dev vxlan100
ip netns exec vx_b ip link set vxlan100 up

# Step 8: both sides now look like they're on the same Ethernet segment,
# regardless of how the 10.0.0.0/30 "underlay" actually routes between them
ip netns exec vx_a ping -c1 172.20.0.2

ip netns delete vx_a
ip netns delete vx_b
