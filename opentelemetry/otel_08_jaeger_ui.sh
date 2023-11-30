#!/usr/bin/env sh
# Run: sh otel_08_jaeger_ui.sh
# What this step adds: best friend #1 -- Jaeger, a tracing backend with a
# UI for exploring the traces steps 2/5/7 have been printing to a console
# or a Collector's debug exporter.
# Step 8: Jaeger UI

# All-in-one image: UI + OTLP receiver + in-memory storage, one container
docker run --rm --name jaeger \
  -p 16686:16686 \
  -p 4317:4317 -p 4318:4318 \
  jaegertracing/all-in-one:latest

# Step 8: point step 5/7's OTLPSpanExporter(endpoint=...) straight at
# Jaeger's own OTLP ports above -- no Collector required for this step.
# Open http://localhost:16686, pick a service.name from step 5/7, and see
# the actual span tree/timeline your code produced.

docker stop jaeger
