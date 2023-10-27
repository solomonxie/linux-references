#!/usr/bin/env sh
# Run: sh otel_11_semantic_conventions.sh (reference notes, not meant to fully execute)
# What this step adds: semantic conventions -- OTel's standard attribute
# names, so a `service.name`/`http.method` from one team's instrumentation
# means the same thing (and lights up the same Grafana/Jaeger dashboards)
# as another team's.
# Step 11: semantic conventions

# Resource attributes (identify the *producer*, set once):
#   service.name, service.version, service.instance.id, deployment.environment

# Span attributes by domain (a small sample -- see opentelemetry.io/docs/specs):
#   http.request.method, http.response.status_code, url.full     (HTTP)
#   db.system, db.statement, db.namespace                        (databases)
#   messaging.system, messaging.destination.name                 (queues)
#   rpc.system, rpc.method                                       (RPC/gRPC)

# Why it matters in practice: a Collector processor or a Grafana dashboard
# can filter/group on `http.response.status_code >= 500` across every
# instrumented service at once, only because every auto-instrumentor
# (step 3) emits that exact attribute name instead of inventing its own.
