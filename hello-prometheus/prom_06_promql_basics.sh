#!/usr/bin/env sh
# Run: sh prom_06_promql_basics.sh (reference notes; needs steps 3+5 running to actually query)
# What this step adds: PromQL -- querying the time series steps 4/5 have
# been producing.
# Step 6: PromQL basics

# Instant vector -- current value of every app_requests_total series
curl -s 'localhost:9090/api/v1/query?query=app_requests_total'

# rate() -- per-second average over a window; the normal way to read a
# Counter (raw counters only ever go up, rate() turns that into throughput)
curl -s 'localhost:9090/api/v1/query?query=rate(app_requests_total[1m])'

# sum by() -- aggregate away a label you don't care about right now
curl -s 'localhost:9090/api/v1/query?query=sum by (route) (rate(app_requests_total[1m]))'

# histogram_quantile() -- p99 latency from step 4's Histogram buckets
curl -s 'localhost:9090/api/v1/query?query=histogram_quantile(0.99, rate(app_request_duration_seconds_bucket[5m]))'

# range query -- a series of points over time instead of one instant,
# what Grafana (step 11) actually plots
curl -s 'localhost:9090/api/v1/query_range?query=up&start=-3600&end=0&step=60'
