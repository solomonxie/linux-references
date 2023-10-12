#!/usr/bin/env bash
# Run: sh docker_03_dockerfile_multistage.sh
# What this step adds: multi-stage builds and .dockerignore.
# Step 3: multi-stage builds

mkdir -p /tmp/docker_multistage && cd /tmp/docker_multistage

# Step 3: build stage has the toolchain; final stage only has the artifact —
# keeps the shipped image small and free of build-time dependencies
cat <<'EOF' > Dockerfile
FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY main.go .
RUN go build -o /out/app main.go

FROM alpine:3.20
COPY --from=builder /out/app /app
CMD ["/app"]
EOF

cat <<'EOF' > main.go
package main
import "fmt"
func main() { fmt.Println("hello from a multi-stage build") }
EOF

# Step 3: .dockerignore keeps local junk (build caches, .git, secrets) out
# of the build context sent to the daemon
cat <<'EOF' > .dockerignore
.git
*.log
node_modules
EOF

docker build -t docker_multistage:latest .
docker run --rm docker_multistage:latest
docker images docker_multistage   # note the final image excludes the golang toolchain

cd - && rm -rf /tmp/docker_multistage
