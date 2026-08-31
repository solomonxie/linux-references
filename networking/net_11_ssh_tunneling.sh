#!/usr/bin/env bash
# Run: sh net_11_ssh_tunneling.sh
# What this step adds: SSH port forwarding — the ad-hoc, no-setup-required
# tunnel every network engineer reaches for before spinning up a real VPN.
# Step 11: SSH tunneling

# Step 11: local forward — reach a remote-only service (e.g. a DB only
# bound to localhost on the remote host) through a port on this machine
ssh -f -N -L 5432:localhost:5432 user@remote-host
# now localhost:5432 here talks to remote-host's localhost:5432

# Step 11: remote forward — the reverse: expose a local port on the
# remote host, e.g. to demo a local dev server without deploying it
ssh -f -N -R 8080:localhost:3000 user@remote-host
# now remote-host:8080 talks to this machine's localhost:3000

# Step 11: dynamic forward — a full SOCKS5 proxy through the SSH
# connection, routes arbitrary traffic (browser, curl --socks5) through
# the remote host, no per-port setup needed
ssh -f -N -D 1080 user@remote-host
curl --socks5 localhost:1080 https://example.com

# Step 11: -N (no remote command) + -f (background) makes each of the
# above a tunnel-only connection with no interactive shell attached
pkill -f "ssh -f -N" 2>/dev/null
