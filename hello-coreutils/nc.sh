#!/usr/bin/env bash
# Common usage examples for: nc (netcat)

# check if a TCP port is open
nc -zv example.com 80 2>&1

# listen on a port (server side)
# nc -l 8080

# connect to a listening port (client side)
# nc localhost 8080

# send a file over the network
# receiver: nc -l 8080 > received_file
# sender:   nc host 8080 < file_to_send

# quick HTTP request by hand
printf 'GET / HTTP/1.0\r\nHost: example.com\r\n\r\n' | nc example.com 80 | head -5

# port scan a range (basic)
# nc -zv host 20-25
