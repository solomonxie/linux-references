# Progressive Prometheus Lessons

A step-by-step series learning Prometheus — pull-based metrics scraping,
PromQL, alerting — through to the Grafana UI most people put in front of
it. Every file is named `prom_NN_topic`, with the extension matching what
it actually is: `.sh` for CLI-only steps, `.yaml` for a real config file,
`.py` for a runnable script — the explanation lives as comments inside
that real file.

## Setup

```sh
python3 -m venv venv && venv/bin/pip install -r requirements.txt
```

Steps 3, 8, 11, 12 need Docker.

Steps:

| Step | Topic |
|---|---|
| 01. concepts | pull model, Counter/Gauge/Histogram/Summary, labels |
| 02. prometheus.yml | a real scrape config |
| 03. run prometheus | actually running it, querying the HTTP API |
| 04. client instrumentation | exposing `/metrics` from your own app |
| 05. scrape app | adding your app as a scrape target |
| 06. promql basics | instant/range queries, `rate()`, `sum by()`, `histogram_quantile()` |
| 07. alerting rules | a PromQL expression that fires an alert |
| 08. alertmanager | routing/deduping alerts to a real notification channel |
| 09. recording rules | precomputing expensive/frequent queries |
| 10. service discovery | advanced: static vs file_sd vs kubernetes_sd |
| 11. grafana ui | best friend: dashboards on top of Prometheus |
| 12. pushgateway | for batch jobs Prometheus can't scrape in time |
| 13. vs alternatives | advanced: OTel metrics, VictoriaMetrics, Thanos/Mimir, InfluxDB |

## Notes

- Step 4's script uses real `prometheus_client` API calls but wasn't
  executed in this session (no Docker/network available here) — verify
  against your own environment before relying on exact output.
- `host.docker.internal` (steps 5, 11) resolves the host from inside a
  container on Docker Desktop (macOS/Windows); on Linux add
  `--add-host=host.docker.internal:host-gateway` to the `docker run`.
