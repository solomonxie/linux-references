#!/usr/bin/env bash
# Run: sh docker_10_registry.sh
# What this step adds: tagging and pushing/pulling images to/from a registry.
# Step 10: registries

docker build -f docker_02_dockerfile.dockerfile -t docker_demo:latest .   # from step 2
docker images | head -3

# Step 10: tag names encode the registry, repo, and version
docker tag docker_demo:latest myuser/docker_demo:1.0

# Step 10: log in, then push (Docker Hub is the default registry if unqualified)
# docker login
# docker push myuser/docker_demo:1.0

# Step 10: pull a specific tag, or run it straight from the registry
docker pull alpine:3.20
docker run --rm myuser/docker_demo:1.0 2>/dev/null || echo "(image not actually pushed in this demo)"

# Step 10: a local registry for testing without touching Docker Hub
docker run -d -p 5000:5000 --name registry registry:2
docker tag alpine:3.20 localhost:5000/alpine:3.20
docker push localhost:5000/alpine:3.20
docker rm -f registry
