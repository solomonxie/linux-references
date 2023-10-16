#!/usr/bin/env sh
# Run: sh k8s_11_local_clusters.sh (reference notes, not meant to fully execute)
# What this step adds: advanced — local cluster tooling for development.
# Step 11: local clusters

# kind (Kubernetes IN Docker) — runs cluster nodes as docker containers,
# fast to spin up/tear down, popular for CI
# kind create cluster --name demo
# kind delete cluster --name demo

# minikube — a single- (or multi-) node VM/container cluster with a large
# addon ecosystem (dashboard, ingress, metrics-server)
# minikube start
# minikube addons enable ingress
# minikube stop

# k3s — a lightweight, production-grade single binary from Rancher, often
# used on real edge/IoT hardware, not just for local dev
# curl -sfL https://get.k3s.io | sh -

# k3d — k3s nodes running as docker containers, the k3s equivalent of kind
# k3d cluster create demo

# Docker Desktop / Rancher Desktop — a single-node cluster bundled with
# the desktop app, enabled via a checkbox instead of a separate CLI

# rule of thumb: kind/k3d for CI and quick throwaway clusters, minikube
# for a fuller local dev experience with addons, k3s for something closer
# to a real (if small) production deployment
