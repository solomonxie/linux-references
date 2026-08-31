# Run: venv/bin/python otel_07_context_propagation_client.py (needs
# otel_07_context_propagation_server.py running first)
# Step 7: context propagation (client)

from opentelemetry import trace
from opentelemetry.propagate import inject
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor, ConsoleSpanExporter
import requests

provider = TracerProvider(resource=Resource.create({"service.name": "otel-lessons-step7-client"}))
provider.add_span_processor(BatchSpanProcessor(ConsoleSpanExporter()))
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)

with tracer.start_as_current_span("call downstream"):
    headers = {}
    # Step 7: writes a W3C `traceparent: 00-<trace_id>-<span_id>-01` header
    # carrying this span's IDs so the server can parent onto it
    inject(headers)
    resp = requests.get("http://localhost:8000/work", headers=headers, timeout=5)
    print(resp.status_code, resp.text)

provider.shutdown()
# Both processes' consoles show spans sharing one trace_id -- open them
# side by side to see it.
