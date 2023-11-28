#!/usr/bin/env bash
# Run: sh net_04_iptables_basics.sh (needs root)
# What this step adds: packet filtering with iptables.
# Step 4: iptables basics

ip netns add demo_ns; ip netns delete demo_ns

# Step 4: list current rules in the filter table
iptables -L -n -v

# Step 4: allow established/related connections (typical first rule)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Step 4: block a specific source IP
iptables -A INPUT -s 203.0.113.5 -j DROP

# Step 4: allow inbound SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Step 4: undo the demo rules
iptables -D INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -D INPUT -s 203.0.113.5 -j DROP
iptables -D INPUT -p tcp --dport 22 -j ACCEPT
