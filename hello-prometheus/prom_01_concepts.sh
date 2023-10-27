#!/usr/bin/env sh
# Run: sh prom_01_concepts.sh (reference notes, not meant to fully execute)
# What this step adds: Prometheus — a pull-based metrics system: it
# scrapes a `/metrics` HTTP endpoint your app exposes, rather than your
# app pushing samples to it (contrast OTel's push-based OTLP, see
# hello-opentelemetry).
# Step 1: concepts

# Four metric types, all exposed as plain text on /metrics:
# - Counter   — only goes up (requests_total, errors_total)
# - Gauge     — goes up or down (queue_depth, temperature)
# - Histogram — samples into configurable buckets plus a _sum/_count, lets
#               PromQL compute quantiles after the fact (histogram_quantile)
# - Summary   — like a Histogram but quantiles computed client-side; can't
#               be aggregated across instances, generally prefer Histogram

# Every metric carries labels -- key/value pairs turning one metric name
# into a whole family of time series: http_requests_total{method="GET",
# status="200"} and {method="POST", status="500"} are different series.

# Prometheus's own storage is a time-series database (TSDB) on local disk;
# PromQL is the query language (step 6); it does NOT do logs (Loki's job)
# or traces (Jaeger/Tempo/OTel's job) -- metrics only.
