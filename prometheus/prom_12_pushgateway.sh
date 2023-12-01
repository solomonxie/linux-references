#!/usr/bin/env sh
# Run: sh prom_12_pushgateway.sh
# What this step adds: the Pushgateway -- for jobs that finish before
# Prometheus's next scrape would ever see them (a nightly batch job, a
# CI pipeline step), push a final value instead of exposing /metrics for
# Prometheus to pull.
# Step 12: Pushgateway

docker run --rm --name pushgateway -p 9091:9091 prom/pushgateway:latest

# Step 12: a "job" pushes its result once, then exits
echo 'batch_job_last_success_timestamp_seconds 1234567890' | \
  curl --data-binary @- http://localhost:9091/metrics/job/nightly_backup

# Prometheus then scrapes the Pushgateway itself as a normal target:
#   scrape_configs:
#     - job_name: pushgateway
#       honor_labels: true
#       static_configs: [{targets: ["localhost:9091"]}]

# Caution (Prometheus's own docs are blunt about this): pushed values are
# held *forever* until explicitly deleted, so a stale value silently
# looks like a live one -- don't use this as a router for normal service
# metrics, only for genuinely short-lived batch jobs.

docker stop pushgateway
