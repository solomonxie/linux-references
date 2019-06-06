#!/usr/bin/env bash
# Run: sh systemd_05_journald.sh (on a systemd distro)
# What this step adds: reading service logs via journald.
# Step 5: journalctl

sudo systemctl start myecho

# Step 5: logs for a specific unit
journalctl -u myecho

# Step 5: follow logs live, like tail -f
journalctl -u myecho -f &
sleep 1; kill %1 2>/dev/null

# Step 5: logs since a time window
journalctl -u myecho --since "10 min ago"

# Step 5: kernel + all boot messages for the current boot
journalctl -b | head -20

sudo systemctl stop myecho
