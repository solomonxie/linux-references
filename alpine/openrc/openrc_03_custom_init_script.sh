#!/usr/bin/env sh
# Run: sh openrc_03_custom_init_script.sh (on Alpine)
# What this step adds: writing your own /etc/init.d service script.
# Step 3: custom init script

rc-service sshd start
rc-update add sshd default

# Step 3: a minimal OpenRC init script for a background command
cat <<'EOF' > /etc/init.d/myecho
#!/sbin/openrc-run
name="myecho"
command="/usr/bin/nc"
command_args="-l -p 9000"
command_background="true"
pidfile="/run/${RC_SVCNAME}.pid"
EOF
chmod +x /etc/init.d/myecho

# Step 3: now it behaves like any other service
rc-service myecho start
rc-service myecho status
rc-service myecho stop
