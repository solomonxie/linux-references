#!/usr/bin/env bash
# Common usage examples for: ss (socket statistics; Linux — use netstat on macOS/BSD)

# all listening TCP sockets with process info
ss -ltnp 2>/dev/null

# all established TCP connections
ss -tn state established 2>/dev/null

# all UDP sockets
ss -unp 2>/dev/null

# summary statistics
ss -s

# filter by port
ss -ltn 'sport = :22' 2>/dev/null

# macOS/BSD equivalent (no ss): netstat -anp tcp
