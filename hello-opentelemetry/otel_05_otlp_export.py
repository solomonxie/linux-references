# Run: venv/bin/python otel_05_otlp_export.py (needs step 4's Collector running)
# What this step adds: swap step 2's ConsoleSpanExporter for OTLPSpanExporter
# -- same API and spans, now shipped over gRPC to the Collector instead of
# printed locally.
# Step 5: OTLP export

from opentelemetry import trace
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor

resource = Resource.create({"service.name": "otel-lessons-step5"})
provider = TracerProvider(resource=resource)
# Step 5: localhost:4317 is the Collector's OTLP/gRPC receiver from step 4
provider.add_span_processor(BatchSpanProcessor(OTLPSpanExporter(endpoint="localhost:4317", insecure=True)))
trace.set_tracer_provider(provider)

tracer = trace.get_tracer(__name__)
with tracer.start_as_current_span("handle_request"):
    with tracer.start_as_current_span("query_database"):
        pass

provider.shutdown()
print("sent; check the Collector's `debug` exporter output")
