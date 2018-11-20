#!/usr/bin/env sh
# Run: sh openrc_01_service_basics.sh (on Alpine)
# What this step adds: starting/stopping/checking services with OpenRC.
# Step 1: rc-service / rc-status

apk add sshd 2>/dev/null

# Step 1: start / stop / restart a service
rc-service sshd start
rc-service sshd status
rc-service sshd restart
rc-service sshd stop

# Step 1: list all services and which runlevel(s) they're in
rc-status -a
