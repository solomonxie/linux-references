#!/usr/bin/env sh
# Run: sh otel_09_prometheus_exporter.sh (needs otel_04_collector_config.yaml's
# `prometheus` exporter running, already wired to port 8889)
# What this step adds: best friend #2 -- Prometheus as the metrics backend
# for step 6's counter/histogram, via the Collector's `prometheus` exporter
# (see prometheus for how Prometheus itself does the scraping).
# Step 9: Prometheus as a metrics backend

# 1. Run step 4's Collector (already exports Prometheus format on :8889)
# 2. Run step 6's metrics script to generate some data
# 3. See the raw exposition format the Collector is now serving:
curl -s localhost:8889/metrics | grep requests_total

# 4. Point a Prometheus server at it -- see prometheus step 02 for a
# real prometheus.yml; the only addition needed is a scrape target:
#   - job_name: otel-collector
#     static_configs:
#       - targets: ["localhost:8889"]
