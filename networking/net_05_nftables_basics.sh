#!/usr/bin/env bash
# Run: sh net_05_nftables_basics.sh (needs root)
# What this step adds: nftables, the modern successor to iptables.
# Step 5: nftables basics

iptables -L -n -v | head -5

# Step 5: nftables organizes rules into tables and chains you define yourself
nft add table inet demo_filter
nft add chain inet demo_filter input { type filter hook input priority 0 \; }

# Step 5: add rules to the chain
nft add rule inet demo_filter input tcp dport 22 accept
nft add rule inet demo_filter input ip saddr 203.0.113.5 drop

# Step 5: view the ruleset (equivalent to iptables -L, but structured)
nft list ruleset

nft delete table inet demo_filter
