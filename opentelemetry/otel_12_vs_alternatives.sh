#!/usr/bin/env sh
# Run: sh otel_12_vs_alternatives.sh (reference notes, not meant to fully execute)
# What this step adds: advanced -- OpenTelemetry vs the alternatives it
# largely superseded or sits alongside.
# Step 12: vs alternatives

# vs vendor SDKs (Datadog ddtrace, New Relic agent...) -- vendor SDKs are
# usually easier to start with (one install, their backend just works) but
# lock instrumentation to that vendor; OTel's SDK/API is the same no matter
# which exporter/backend you point it at, so switching backends later
# doesn't mean re-instrumenting

# vs OpenTracing + OpenCensus -- OTel is their 2019 merger; both are
# deprecated, migrate off them if you still see either

# vs Prometheus client libraries directly -- Prometheus's own client_python
# (see prometheus step 04) is simpler for metrics-only services with
# no tracing/logs need and no Collector in the path; OTel's Metrics API
# is the better fit once you also want traces, or want the Collector's
# pipeline (step 4) processing/routing metrics before they land anywhere

# vs raw structured logging -- OTel's Logs signal is the newest and least
# universally adopted pillar; trace-log correlation (a trace_id field in
# your existing log lines, as step 7's spans imply) gets most of the
# practical benefit today without fully switching log emission to OTel

# rule of thumb: reach for OTel when more than one backend/language is in
# play, or you want traces+metrics+logs correlated by one trace_id; reach
# for a single vendor SDK or Prometheus's client lib when the stack is
# small and single-purpose
