#!/usr/bin/env bash
# Run: sh systemd_06_timers.sh (on a systemd distro)
# What this step adds: .timer units, systemd's alternative to cron.
# Step 6: timers

sudo systemctl daemon-reload

# Step 6: a oneshot service the timer will trigger
cat <<'EOF' | sudo tee /etc/systemd/system/myecho-log.service
[Unit]
Description=Log a heartbeat

[Service]
Type=oneshot
ExecStart=/usr/bin/echo "heartbeat at $(date)"
EOF

# Step 6: the timer that runs it on a schedule
cat <<'EOF' | sudo tee /etc/systemd/system/myecho-log.timer
[Unit]
Description=Run myecho-log every 5 minutes

[Timer]
OnCalendar=*:0/5
Persistent=true

[Install]
WantedBy=timers.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now myecho-log.timer
systemctl list-timers | head -5
sudo systemctl disable --now myecho-log.timer
