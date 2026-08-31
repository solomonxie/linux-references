#!/usr/bin/env sh
# Run: sh otel_01_concepts.sh (reference notes, not meant to fully execute)
# What this step adds: OpenTelemetry (OTel) — a vendor-neutral standard for
# generating and exporting telemetry, so instrumentation code doesn't lock
# you into one backend (Jaeger/Prometheus/Datadog/etc all just plug in as
# an exporter).
# Step 1: concepts

# Three signals, one API/SDK:
# - traces  — a Span tree per request, showing where time went across calls
# - metrics — numeric measurements over time (counters, gauges, histograms)
# - logs    — the newest pillar, correlated to traces via trace_id

# Core vocabulary:
# - Span      — one unit of work: name, start/end time, attributes, a
#               trace_id + span_id, and a parent_span_id linking it into a trace
# - Resource  — attributes identifying *what* produced the telemetry
#               (service.name, service.version, host...), attached once
# - Tracer / Meter — factories from a "provider", used to start spans /
#               record measurements
# - Exporter  — where the SDK sends finished spans/metrics: console (step 2),
#               OTLP over gRPC/HTTP (step 5), or straight to a vendor
# - Collector — an optional standalone process that receives OTLP and can
#               batch/transform/fan out to multiple backends (step 4)

# The wire protocol is OTLP (OpenTelemetry Protocol), default ports:
# 4317 = OTLP/gRPC, 4318 = OTLP/HTTP — every backend in this series speaks it.

# Two ways to get instrumented:
# - manual    — call the API yourself around the code you care about (step 2)
# - automatic — a language-specific agent monkey-patches known libraries
#               (http clients/servers, DB drivers...) with zero code
#               changes (step 3)
