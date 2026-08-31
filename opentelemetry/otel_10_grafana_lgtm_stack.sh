#!/usr/bin/env sh
# Run: sh otel_10_grafana_lgtm_stack.sh
# What this step adds: best friend #3 -- the Grafana "LGTM" stack (Loki
# logs, Grafana UI, Tempo traces, Mimir/Prometheus metrics) bundled into
# one image, all fed straight from OTLP -- the batteries-included version
# of wiring steps 8+9 up by hand.
# Step 10: Grafana LGTM stack

docker run --rm --name lgtm \
  -p 3000:3000 \
  -p 4317:4317 -p 4318:4318 \
  grafana/otel-lgtm:latest

# Step 10: point steps 5/6/7's OTLP exporters (endpoint="localhost:4317")
# at this one container instead of a bare Collector -- it already stores
# traces (Tempo), metrics (Mimir/Prometheus), and can take logs (Loki).
# Open http://localhost:3000 (admin/admin) -- traces, metrics, and logs
# for the same service.name are all queryable from one Grafana instance,
# with trace-to-metrics exemplars linking a slow trace to the metric
# spike it caused.

docker stop lgtm
