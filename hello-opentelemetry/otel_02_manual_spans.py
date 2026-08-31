# Run: venv/bin/python otel_02_manual_spans.py
# What this step adds: the OTel Traces API/SDK by hand — a TracerProvider,
# a Span, and the simplest possible exporter (stdout), no collector or
# backend needed yet.
# Step 2: manual span creation

from opentelemetry import trace
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor, ConsoleSpanExporter

# Step 2: a Resource says *what* is producing spans -- shows up on every span
resource = Resource.create({"service.name": "otel-lessons-step2"})

provider = TracerProvider(resource=resource)
provider.add_span_processor(BatchSpanProcessor(ConsoleSpanExporter()))
trace.set_tracer_provider(provider)

tracer = trace.get_tracer(__name__)

# Step 2: a span around the "work", with a nested child span
with tracer.start_as_current_span("handle_request") as span:
    span.set_attribute("user.id", "demo-user")
    with tracer.start_as_current_span("query_database") as child:
        child.set_attribute("db.statement", "SELECT 1")

# BatchSpanProcessor exports on a timer/shutdown; flush so console output
# actually appears before the process exits.
provider.shutdown()
