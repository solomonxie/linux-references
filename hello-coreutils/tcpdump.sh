#!/usr/bin/env bash
# Common usage examples for: tcpdump (requires root/sudo on most systems)

# capture on a specific interface
# tcpdump -i eth0

# capture traffic on/to a specific port
# tcpdump -i any port 80

# capture only a specific host's traffic
# tcpdump -i any host 10.0.0.5

# write capture to a file for later analysis (in Wireshark, etc.)
# tcpdump -i any -w capture.pcap

# read a previously saved capture
# tcpdump -r capture.pcap

# show packet contents in ASCII, not just headers
# tcpdump -i any -A port 80

# limit to N packets then stop
# tcpdump -i any -c 20
