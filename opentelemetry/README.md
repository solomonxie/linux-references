# Progressive OpenTelemetry Lessons

A step-by-step series learning OpenTelemetry (OTel) — the vendor-neutral
API/SDK for traces, metrics, and logs — from manual instrumentation
through the Collector to the UI stacks that actually display the data
(Jaeger, Grafana). Every file is named `otel_NN_topic`, with the
extension matching what it actually is: `.sh` for CLI-only steps, `.py`
for a runnable script, `.yaml` for a real config file — the explanation
lives as comments inside that real file.

## Setup

```sh
python3 -m venv venv && venv/bin/pip install -r requirements.txt
```

Steps 8-10 need Docker; steps 4-10 need ports 4317/4318 (OTLP) free.

Steps:

| Step | Topic |
|---|---|
| 01. concepts | signals, spans, resources, the OTLP protocol |
| 02. manual spans | Tracer/Span API by hand, console exporter |
| 03. auto instrumentation | `opentelemetry-instrument`, zero code changes |
| 04. collector config | a real Collector config: receivers/processors/exporters |
| 05. otlp export | shipping step 2's spans to the Collector over OTLP |
| 06. metrics | Meter/Counter/Histogram API, OTLP export |
| 07. context propagation | one trace across two processes via `traceparent` |
| 08. jaeger ui | best friend: Jaeger, a tracing backend + UI |
| 09. prometheus exporter | best friend: the Collector's `prometheus` exporter |
| 10. grafana lgtm stack | best friend: Grafana+Loki+Tempo+Mimir in one OTLP-native image |
| 11. semantic conventions | standard attribute names across instrumentors |
| 12. vs alternatives | advanced: vendor SDKs, OpenTracing/OpenCensus, Prometheus client libs |

## Notes

- Steps 2/5/6/7 exercise real OTel Python API calls but weren't executed in
  this session (no Docker/network available here) — verify against your
  own environment before relying on exact output; exact method names can
  drift a little across SDK minor versions.
- Steps 8-10 aren't three separate always-on backends — pick one per run
  (Jaeger for traces only, or the LGTM stack for all three signals) and
  point that step's OTLP exporter `endpoint` at whichever is running.
