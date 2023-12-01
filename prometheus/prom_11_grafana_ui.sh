#!/usr/bin/env sh
# Run: sh prom_11_grafana_ui.sh (needs step 3's Prometheus running)
# What this step adds: best friend -- Grafana, the dashboard/UI almost
# everyone puts in front of Prometheus's own bare-bones graph page.
# Step 11: Grafana UI

docker run --rm --name grafana -p 3000:3000 grafana/grafana:latest

# Step 11: open http://localhost:3000 (admin/admin), add a data source --
# Connections > Data sources > Prometheus > URL: http://host.docker.internal:9090
# -- then Explore or build a dashboard against the same app_requests_total/
# app_request_duration_seconds series step 6 queried by hand.

docker stop grafana
