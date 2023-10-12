#!/usr/bin/env sh
# Run: sh docker_09_other_alternatives.sh (reference notes, not meant to fully execute)
# What this step adds: advanced — the rest of the container tooling landscape.
# Step 9: other docker alternatives

podman run --rm alpine echo "via podman"

# Step 9: buildah — builds OCI images without a daemon, often paired with
# podman for running them; more scriptable/lower-level than `docker build`
# buildah bud -t myimage .

# Step 9: nerdctl — a docker-compatible CLI for containerd (the runtime
# docker itself uses under the hood), useful when only containerd is present
# nerdctl run --rm alpine echo hi

# Step 9: containerd / runc / crun — the actual low-level runtimes underneath
# docker, podman, and Kubernetes; you rarely invoke these directly, docker
# and podman both shell out to one of them to actually start a container
# ctr images pull docker.io/library/alpine:latest   # talking to containerd directly

# Step 9: Desktop-integration alternatives to Docker Desktop, mostly for
# macOS/Windows, since native containers need a Linux kernel:
#   colima       — lightweight Lima-based VM + docker context, CLI-only
#   lima         — general-purpose Linux VMs on macOS, colima is built on it
#   Rancher Desktop — GUI alternative bundling containerd/moby + Kubernetes

# Step 9: rule of thumb — docker for the broadest ecosystem/tooling support,
# podman when you want rootless-by-default and no daemon, buildah/nerdctl
# when you're composing a minimal toolchain around containerd directly
