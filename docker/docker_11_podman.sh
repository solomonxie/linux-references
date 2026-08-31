#!/usr/bin/env bash
# Run: sh docker_11_podman.sh
# What this step adds: podman — a daemonless, rootless docker alternative.
# Step 11: podman

docker run --rm alpine echo "via docker"

# Step 11: podman's CLI mirrors docker's closely — most `docker ...`
# commands from steps 1-10 work verbatim as `podman ...`
podman run --rm alpine echo "via podman"
podman build -f docker_02_dockerfile.dockerfile -t docker_demo:latest .   # same Dockerfile as step 2
podman ps -a
podman images

# Step 11: key differences from docker
# - no background daemon: podman talks to the kernel directly per-command
# - rootless by default: containers run as your user, not a root daemon,
#   using user namespaces (see namespaces-cgroups)
# - `podman-compose` (or podman's native `podman compose`) reads the same
#   compose files from steps 6-9
# - `alias docker=podman` is a common drop-in for scripts that assume docker

# Step 11: pods — podman's native grouping of containers sharing one network
# namespace, closer to a Kubernetes pod than anything docker has natively
podman pod create --name demo_pod -p 8080:80
podman run -d --pod demo_pod --name web nginx:alpine
podman pod rm -f demo_pod
