# Run: venv/bin/python otel_07_context_propagation_server.py
# What this step adds: the *other* half of tracing a request across
# process boundaries -- extracting an incoming trace context so a span
# here nests under the caller's span instead of starting a new trace.
# Step 7: context propagation (server)

from http.server import BaseHTTPRequestHandler, HTTPServer

from opentelemetry import trace
from opentelemetry.propagate import extract
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor, ConsoleSpanExporter

provider = TracerProvider(resource=Resource.create({"service.name": "otel-lessons-step7-server"}))
provider.add_span_processor(BatchSpanProcessor(ConsoleSpanExporter()))
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Step 7: pull the W3C traceparent header the client injected and
        # use it as this span's parent -- one trace spans both processes
        ctx = extract(dict(self.headers))
        with tracer.start_as_current_span("handle /work", context=ctx):
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"ok")


HTTPServer(("localhost", 8000), Handler).serve_forever()
