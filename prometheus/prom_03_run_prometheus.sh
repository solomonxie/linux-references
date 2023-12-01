#!/usr/bin/env sh
# Run: sh prom_03_run_prometheus.sh
# What this step adds: actually running Prometheus against step 2's config.
# Step 3: run Prometheus

docker run --rm --name prometheus -p 9090:9090 \
  -v "$(pwd)/prom_02_prometheus_yml.yaml:/etc/prometheus/prometheus.yml" \
  prom/prometheus:latest

# Step 3: query via the HTTP API...
curl -s 'localhost:9090/api/v1/query?query=up' | head -c 300
# ...or open http://localhost:9090/graph for the built-in UI (basic --
# step 11's Grafana is what most people actually use day to day)

docker stop prometheus
