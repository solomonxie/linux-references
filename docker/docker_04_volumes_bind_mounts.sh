#!/usr/bin/env bash
# Run: sh docker_04_volumes_bind_mounts.sh
# What this step adds: persisting and sharing data with volumes and bind mounts.
# Step 4: volumes and bind mounts

# Step 4: named volume — managed by docker, survives container removal
docker volume create demo_vol
docker run --rm -v demo_vol:/data alpine sh -c 'echo hello > /data/f.txt'
docker run --rm -v demo_vol:/data alpine cat /data/f.txt
docker volume inspect demo_vol
docker volume rm demo_vol

# Step 4: bind mount — a specific host path, useful for local dev
mkdir -p /tmp/bind_demo
echo "from host" > /tmp/bind_demo/host_file.txt
docker run --rm -v /tmp/bind_demo:/host alpine cat /host/host_file.txt
rm -rf /tmp/bind_demo

# Step 4: read-only mount, common for config files
docker run --rm -v demo_vol:/data:ro alpine sh -c 'echo x > /data/f.txt' || echo "read-only, write failed as expected"
