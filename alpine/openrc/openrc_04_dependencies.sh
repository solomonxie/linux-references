#!/usr/bin/env sh
# Run: sh openrc_04_dependencies.sh (on Alpine)
# What this step adds: declaring service dependencies/ordering.
# Step 4: need / use / after

cat <<'EOF' > /etc/init.d/myecho
#!/sbin/openrc-run
name="myecho"
command="/usr/bin/nc"
command_args="-l -p 9000"
command_background="true"
pidfile="/run/${RC_SVCNAME}.pid"

# Step 4: dependency declarations
depend() {
	need net          # hard requirement: net must be up first
	use dns logger     # soft: use if available, don't fail without it
	after firewall     # ordering only: start after firewall if it's enabled
}
EOF
chmod +x /etc/init.d/myecho

rc-service myecho start
rc-service myecho stop
