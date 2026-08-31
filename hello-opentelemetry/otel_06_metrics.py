# Run: venv/bin/python otel_06_metrics.py (needs step 4's Collector running)
# What this step adds: the Metrics API/SDK -- a Meter, a Counter, and a
# Histogram, exported over OTLP the same way traces were in step 5.
# Step 6: metrics

import random
import time

from opentelemetry import metrics
from opentelemetry.exporter.otlp.proto.grpc.metric_exporter import OTLPMetricExporter
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader
from opentelemetry.sdk.resources import Resource

resource = Resource.create({"service.name": "otel-lessons-step6"})
reader = PeriodicExportingMetricReader(
    OTLPMetricExporter(endpoint="localhost:4317", insecure=True),
    export_interval_millis=2000,
)
metrics.set_meter_provider(MeterProvider(resource=resource, metric_readers=[reader]))

meter = metrics.get_meter(__name__)
# Step 6: a Counter only goes up (requests served); a Histogram buckets a
# distribution (request duration) -- the same two shapes hello-prometheus's
# client library exposes, just via the OTel API instead
request_counter = meter.create_counter("requests_total")
duration_histogram = meter.create_histogram("request_duration_seconds")

for _ in range(5):
    request_counter.add(1, {"route": "/demo"})
    duration_histogram.record(random.uniform(0.01, 0.2), {"route": "/demo"})
    time.sleep(1)

print("sent; check the Collector's `debug` exporter output")
