#!/usr/bin/env bash
# Run: sh systemd_04_dependencies.sh (on a systemd distro)
# What this step adds: declaring dependencies/ordering between units.
# Step 4: Wants / Requires / After / Before

cat <<'EOF' | sudo tee /etc/systemd/system/myecho.service
[Unit]
Description=My echo listener
# Step 4: dependency declarations
Wants=network-online.target
After=network-online.target
Requires=myecho.socket

[Service]
ExecStart=/usr/bin/nc -l -p 9000
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start myecho
sudo systemctl stop myecho

# Step 4: Wants = soft dependency, Requires = hard dependency,
# After/Before = ordering only (independent of Wants/Requires)
