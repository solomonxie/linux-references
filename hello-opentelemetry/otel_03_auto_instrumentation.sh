#!/usr/bin/env sh
# Run: sh otel_03_auto_instrumentation.sh (needs otel_03_uninstrumented_app.py alongside; network access)
# What this step adds: zero-code-change instrumentation via
# `opentelemetry-instrument`, which patches known libraries (here:
# `requests`) at process startup.
# Step 3: auto instrumentation

# One-time: discover+install instrumentors for whatever's in this venv
venv/bin/opentelemetry-bootstrap -a install

# Step 3: run step 2's-sibling plain script through the auto
# instrumentation agent -- no OTel import in otel_03_uninstrumented_app.py
OTEL_SERVICE_NAME=otel-lessons-step3 \
OTEL_TRACES_EXPORTER=console \
OTEL_METRICS_EXPORTER=none \
OTEL_LOGS_EXPORTER=none \
venv/bin/opentelemetry-instrument venv/bin/python otel_03_uninstrumented_app.py

# A span for the outbound GET (http.method, url.full, http.status_code)
# prints to stdout, generated entirely by the requests instrumentor.
