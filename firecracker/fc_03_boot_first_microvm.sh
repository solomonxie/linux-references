#!/usr/bin/env bash
# Run: sh fc_03_boot_first_microvm.sh (needs step 2's binary + images, root, KVM)
# What this step adds: booting a microVM via Firecracker's HTTP API.
# Step 3: boot a first microVM

cd ~/fc_demo

# Step 3: Firecracker itself exposes no CLI for configuration -- everything
# goes through a REST API served over a unix socket
rm -f fc.sock
firecracker --api-sock fc.sock &
FC_PID=$!
sleep 0.3

api() { curl -s --unix-socket fc.sock -X "$1" "http://localhost/$2" -H 'Content-Type: application/json' -d "$3"; }

# Step 3: set the kernel to boot
api PUT boot-source '{
  "kernel_image_path": "vmlinux-5.10.223",
  "boot_args": "console=ttyS0 reboot=k panic=1 pci=off"
}'

# Step 3: attach the root filesystem as a virtio block device
api PUT drives/rootfs '{
  "drive_id": "rootfs",
  "path_on_host": "ubuntu-22.04.ext4",
  "is_root_device": true,
  "is_read_only": false
}'

# Step 3: how many vCPUs / how much memory this microVM gets
api PUT machine-config '{"vcpu_count": 1, "mem_size_mib": 128}'

# Step 3: start it -- output appears on the serial console (this terminal)
api PUT actions '{"action_type": "InstanceStart"}'
sleep 2
api GET machine-config

kill "$FC_PID"
