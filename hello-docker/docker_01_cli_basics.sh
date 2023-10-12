#!/usr/bin/env bash
# Run: sh docker_01_cli_basics.sh
# What this step adds: the core docker CLI verbs.
# Step 1: cli basics

docker version
docker run hello-world

# Step 1: images and containers
docker images
docker ps                 # running containers
docker ps -a               # all containers, including stopped

# Step 1: interactive vs detached
docker run -it --rm alpine sh -c 'echo hi from alpine'
docker run -d --name bg_demo alpine sleep 60

# Step 1: logs, exec into a running container, stop/remove
docker logs bg_demo
docker exec bg_demo echo "hello from inside"
docker stop bg_demo
docker rm bg_demo
