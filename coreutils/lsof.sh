#!/usr/bin/env bash
# Common usage examples for: lsof

# all files opened by a specific process id
lsof -p $$

# who has a specific file open
lsof /etc/hosts

# what's listening on a specific TCP port
lsof -i :22

# all network connections for a process name
lsof -i -c ssh

# all open files under a directory
lsof +D /tmp 2>/dev/null | head -5

# files opened by a specific user
lsof -u "$(whoami)" 2>/dev/null | head -5
