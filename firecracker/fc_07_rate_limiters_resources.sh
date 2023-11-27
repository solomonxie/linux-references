#!/usr/bin/env bash
# Run: sh fc_07_rate_limiters_resources.sh (continues step 3, before InstanceStart)
# What this step adds: capping a microVM's resource usage -- the
# multi-tenant fairness story, alongside jailer's (step 5) security story.
# Step 7: rate limiters and resource limits

api() { curl -s --unix-socket fc.sock -X "$1" "http://localhost/$2" -H 'Content-Type: application/json' -d "$3"; }

# Step 7: vCPU/memory ceiling (same knob as step 3, called out on its own)
api PUT machine-config '{"vcpu_count": 2, "mem_size_mib": 256}'

# Step 7: token-bucket rate limiters on a drive's throughput and IOPS --
# bandwidth in bytes/s, ops in operations/s, both with a burst allowance
api PUT drives/rootfs '{
  "drive_id": "rootfs",
  "path_on_host": "ubuntu-22.04.ext4",
  "is_root_device": true,
  "rate_limiter": {
    "bandwidth": {"size": 1048576, "refill_time": 100},
    "ops": {"size": 100, "refill_time": 100}
  }
}'

# Step 7: same idea on the network interface from step 4
api PATCH network-interfaces/eth0 '{
  "iface_id": "eth0",
  "rx_rate_limiter": {"bandwidth": {"size": 1048576, "refill_time": 100}},
  "tx_rate_limiter": {"bandwidth": {"size": 1048576, "refill_time": 100}}
}'
