#!/usr/bin/env sh
# Run: sh prom_10_service_discovery.sh (reference notes, not meant to fully execute)
# What this step adds: advanced -- discovering scrape targets instead of
# hand-listing them in static_configs (steps 2/5).
# Step 10: service discovery

# file_sd -- targets read from a JSON/YAML file Prometheus polls for
# changes; simplest way to decouple target lists from prometheus.yml:
#   scrape_configs:
#     - job_name: file-sd-demo
#       file_sd_configs:
#         - files: ["targets/*.json"]

# kubernetes_sd -- targets discovered from the Kubernetes API (Pods,
# Services, Endpoints); the usual choice inside a cluster, often paired
# with the `prometheus.io/scrape: "true"` Pod annotation convention:
#   scrape_configs:
#     - job_name: kubernetes-pods
#       kubernetes_sd_configs:
#         - role: pod

# other *_sd_configs exist per cloud (ec2, azure, gce, consul, dns...) --
# same idea: Prometheus asks the platform "what's running" on each refresh
# instead of a human maintaining a static list.

# rule of thumb: static_configs for a handful of fixed targets (this
# series), file_sd for anything scripted/templated, kubernetes_sd once
# you're actually inside a cluster (see hello-kubernetes).
