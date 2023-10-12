#!/usr/bin/env bash
# Run: sh docker_06_compose.sh
# What this step adds: docker compose — declaring a multi-container app in one file.
# Step 6: docker compose basics

docker network create demo_net 2>/dev/null; docker network rm demo_net 2>/dev/null

mkdir -p /tmp/compose_demo && cd /tmp/compose_demo

cat <<'EOF' > compose.yaml
services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    depends_on:
      - api
  api:
    image: alpine
    command: sh -c "while true; do echo api alive; sleep 5; done"
EOF

# Step 6: brings up both services, on a shared network compose creates automatically
docker compose up -d
docker compose ps
docker compose logs api --tail 3

# Step 6: tear down (add -v to also remove volumes)
docker compose down

cd - && rm -rf /tmp/compose_demo
