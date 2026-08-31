#!/usr/bin/env sh
# Run: sh systemd_07_vs_openrc.sh (reference notes, not meant to fully execute)
# What this step adds: advanced — systemd vs OpenRC concept mapping.
# Step 7: systemd vs OpenRC

# Step 7: rough command equivalents (see os-alpine/hello-openrc.sh section 5
# for the mirror image of this table)
#   rc-service foo start     <->  systemctl start foo
#   rc-update add foo default <-> systemctl enable foo
#   rc-service foo status    <->  systemctl status foo
#   rc-status -a              <->  systemctl list-units --type=service
#   service log file          <->  journalctl -u foo

# Step 7: dependency model — OpenRC's need/use/after in depend() maps to
# systemd's Requires=/Wants=/After= in [Unit]

# Step 7: PID 1 model — OpenRC is a script-driven supervisor over SysV-style
# init scripts; systemd is a single daemon that natively tracks cgroups per
# unit, which is why "systemctl stop" reliably kills a whole process tree
# where an OpenRC script relying on a pidfile sometimes leaves orphans
