#!/usr/bin/env sh
# Run: sh openrc_05_vs_systemd.sh (reference notes, not meant to fully execute)
# What this step adds: advanced — OpenRC vs systemd concept mapping.
# Step 5: OpenRC vs systemd

# Step 5: rough command equivalents
#   systemctl start foo     <->  rc-service foo start
#   systemctl enable foo    <->  rc-update add foo default
#   systemctl status foo    <->  rc-service foo status
#   systemctl list-units    <->  rc-status -a
#   journalctl -u foo       <->  no built-in equivalent; OpenRC logs via
#                                 whatever the service itself writes
#                                 (often /var/log/<service>.log), or openrc's
#                                 own supervise-daemon logging options

# Step 5: converting a systemd unit's [Service] ExecStart into OpenRC:
cat <<'EOF' > /etc/init.d/myapp
#!/sbin/openrc-run
name="myapp"
command="/usr/bin/myapp"          # from ExecStart=
command_args="--config /etc/myapp.conf"
command_user="myapp:myapp"        # from User=/Group=
supervisor="supervise-daemon"     # OpenRC's process supervisor, akin to systemd's

depend() { need net; }
EOF
chmod +x /etc/init.d/myapp
