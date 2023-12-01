# Run: venv/bin/python prom_04_client_instrumentation.py
# What this step adds: exposing metrics from your own app with
# `prometheus_client` -- a Counter and a Histogram served on /metrics for
# Prometheus to scrape.
# Step 4: client instrumentation

import random
import time

from prometheus_client import Counter, Histogram, start_http_server

REQUESTS = Counter("app_requests_total", "Total requests", ["route"])
LATENCY = Histogram("app_request_duration_seconds", "Request duration", ["route"])

start_http_server(8000)  # serves http://localhost:8000/metrics
print("serving /metrics on :8000 -- curl it, or scrape it with step 5's config")

while True:
    with LATENCY.labels(route="/demo").time():
        time.sleep(random.uniform(0.01, 0.2))
    REQUESTS.labels(route="/demo").inc()
