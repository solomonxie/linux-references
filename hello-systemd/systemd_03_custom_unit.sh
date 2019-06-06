#!/usr/bin/env bash
# Run: sh systemd_03_custom_unit.sh (on a systemd distro)
# What this step adds: writing your own .service unit file.
# Step 3: custom unit

systemctl start sshd
systemctl enable sshd

# Step 3: a minimal service unit for a background command
cat <<'EOF' | sudo tee /etc/systemd/system/myecho.service
[Unit]
Description=My echo listener

[Service]
ExecStart=/usr/bin/nc -l -p 9000
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Step 3: reload the unit cache, then treat it like any other service
sudo systemctl daemon-reload
sudo systemctl start myecho
sudo systemctl status myecho
sudo systemctl stop myecho
