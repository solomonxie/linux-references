#!/usr/bin/env bash
# Run: sh docker_02_dockerfile_basics.sh
# What this step adds: writing and building a Dockerfile.
# Step 2: Dockerfile basics

docker run --rm alpine echo hi

mkdir -p /tmp/docker_demo && cd /tmp/docker_demo

# Step 2: a minimal Dockerfile
cat <<'EOF' > Dockerfile
FROM alpine:3.20
RUN apk add --no-cache curl
COPY app.sh /app.sh
RUN chmod +x /app.sh
CMD ["/app.sh"]
EOF

cat <<'EOF' > app.sh
#!/bin/sh
echo "hello from the built image"
EOF

# Step 2: build, tag, run
docker build -t docker_demo:latest .
docker run --rm docker_demo:latest

cd - && rm -rf /tmp/docker_demo
