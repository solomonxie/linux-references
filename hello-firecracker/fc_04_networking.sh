#!/usr/bin/env bash
# Run: sh fc_04_networking.sh (needs root; continues from step 3's running process)
# What this step adds: giving a microVM a network interface via a TAP device.
# Step 4: networking

# Step 4: Firecracker doesn't create network devices itself -- you create a
# host-side TAP device first, the same primitive veth pairs/bridges use
# (see hello-networking's bridges+veth step), then hand it to the microVM
sudo ip tuntap add tap0 mode tap
sudo ip addr add 172.16.0.1/24 dev tap0
sudo ip link set tap0 up

# Step 4: NAT so the microVM can reach the outside network through the host
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i tap0 -j ACCEPT

api() { curl -s --unix-socket fc.sock -X "$1" "http://localhost/$2" -H 'Content-Type: application/json' -d "$3"; }

# Step 4: attach it as the microVM's network interface, before InstanceStart
api PUT network-interfaces/eth0 '{
  "iface_id": "eth0",
  "guest_mac": "AA:FC:00:00:00:01",
  "host_dev_name": "tap0"
}'

# Step 4: inside the guest (via its console/init), this becomes eth0 --
# configure a static IP there (e.g. 172.16.0.2/24) to complete the link

sudo ip link delete tap0
