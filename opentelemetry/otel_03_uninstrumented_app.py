# Companion app for otel_03_auto_instrumentation.sh -- deliberately has
# zero OTel imports; auto-instrumentation adds tracing without touching
# this file at all.

import requests

resp = requests.get("https://httpbin.org/get", timeout=5)
print("status:", resp.status_code)
