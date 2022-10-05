#!/usr/bin/env sh
# OpenRC — Alpine's init system, one section per topic, basic to advanced.
# Run: sh openrc.sh (on Alpine)

# ----- 1. service basics: rc-service / rc-status -----
apk add sshd 2>/dev/null
rc-service sshd start
rc-service sshd status
rc-service sshd restart
rc-service sshd stop
rc-status -a                                # all services and which runlevel(s) they're in

# ----- 2. runlevels: rc-update -----
rc-service sshd start
rc-update add sshd default                  # boots with the system
rc-update show                              # what's enabled in each runlevel
rc-update del sshd default                  # won't autostart, still runnable manually
# common runlevels: sysinit, boot, default, shutdown

# ----- 3. writing a custom init script -----
cat <<'EOF' > /etc/init.d/myecho
#!/sbin/openrc-run
name="myecho"
command="/usr/bin/nc"
command_args="-l -p 9000"
command_background="true"
pidfile="/run/${RC_SVCNAME}.pid"
EOF
chmod +x /etc/init.d/myecho
rc-service myecho start                     # now it behaves like any other service
rc-service myecho status
rc-service myecho stop

# ----- 4. dependencies: need / use / after -----
cat <<'EOF' > /etc/init.d/myecho
#!/sbin/openrc-run
name="myecho"
command="/usr/bin/nc"
command_args="-l -p 9000"
command_background="true"
pidfile="/run/${RC_SVCNAME}.pid"

depend() {
	need net          # hard requirement: net must be up first
	use dns logger     # soft: use if available, don't fail without it
	after firewall     # ordering only: start after firewall if it's enabled
}
EOF
chmod +x /etc/init.d/myecho
rc-service myecho start
rc-service myecho stop

# ----- 5. OpenRC vs systemd (advanced) -----
# rough command equivalents:
#   systemctl start foo     <->  rc-service foo start
#   systemctl enable foo    <->  rc-update add foo default
#   systemctl status foo    <->  rc-service foo status
#   systemctl list-units    <->  rc-status -a
#   journalctl -u foo       <->  no built-in equivalent; OpenRC logs via
#                                 whatever the service itself writes
#                                 (often /var/log/<service>.log), or its own
#                                 supervise-daemon logging options

# converting a systemd unit's [Service] ExecStart into OpenRC:
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
