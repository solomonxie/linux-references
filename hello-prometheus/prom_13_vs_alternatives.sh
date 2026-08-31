#!/usr/bin/env sh
# Run: sh prom_13_vs_alternatives.sh (reference notes, not meant to fully execute)
# What this step adds: advanced -- Prometheus vs the rest of the metrics
# landscape.
# Step 13: vs alternatives

# vs OpenTelemetry metrics (see hello-opentelemetry) -- OTel's Metrics API
# is push-based over OTLP and vendor-neutral at the instrumentation layer;
# Prometheus is a specific pull-based backend + query language + storage.
# They compose: the OTel Collector's `prometheus` exporter (that series'
# step 9) turns push into a scrape target this series' Prometheus can pull.

# vs VictoriaMetrics -- drop-in Prometheus-compatible (same exposition
# format, a PromQL-compatible query language), usually chosen for lower
# resource use / longer retention at scale.

# vs Thanos / Mimir / Cortex -- these don't replace Prometheus, they sit
# behind many Prometheus instances for long-term/multi-cluster storage
# and a single global query view (see hello-kubernetes: one Prometheus
# per cluster, Thanos/Mimir aggregating across clusters).

# vs InfluxDB -- push-based (like OTel), its own query language (Flux/
# InfluxQL); a more natural fit when you're already writing time series
# from many small/embedded devices rather than scraping HTTP endpoints.

# rule of thumb: plain Prometheus is the default choice for a single
# cluster/fleet; add Thanos/Mimir only once you have multiple Prometheus
# instances you need one query pane over.
