#!/usr/bin/env bash
# Run: sh docker_05_networking.sh
# What this step adds: docker networks and container-to-container communication.
# Step 5: networking

docker network ls

# Step 5: a user-defined bridge network — containers on it resolve each
# other by container name (the default bridge network doesn't do this)
docker network create demo_net

docker run -d --name web --network demo_net nginx:alpine
docker run --rm --network demo_net alpine wget -qO- http://web

# Step 5: publish a container port to the host
docker run -d --name web2 -p 8080:80 nginx:alpine
curl -s localhost:8080 | head -3

docker rm -f web web2
docker network rm demo_net
