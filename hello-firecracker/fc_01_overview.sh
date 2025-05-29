#!/usr/bin/env sh
# Run: sh fc_01_overview.sh (reference notes, not meant to fully execute)
# What this step adds: what Firecracker is and where it sits in the isolation spectrum.
# Step 1: overview

# Step 1: the isolation spectrum, roughly cheapest/least-isolated to
# most-isolated/most-overhead:
#   process             -- plain subprocess, shares everything (see hello-kern step 1)
#   namespaces+cgroups   -- `docker run`, `kern box` (see hello-namespaces-cgroups, hello-kern)
#   microVM              -- Firecracker: a real VM boundary (its own kernel),
#                           but stripped down to boot in ~125ms with ~5MiB overhead
#   full VM              -- a whole QEMU/VirtualBox guest, general-purpose device model

# Step 1: what makes it fast -- Firecracker is a KVM-based Virtual Machine
# Monitor (VMM) written in Rust, but its device model is intentionally
# minimal (no BIOS, no PCI, no VGA, no legacy anything): just a boot
# source, a handful of virtio block/net devices, and a serial console.
# Fewer devices to initialize is most of why it boots so fast.

# Step 1: why AWS built it -- Lambda and Fargate need one microVM per
# customer invocation/task, at massive scale, with a hard security
# boundary between tenants (unlike containers, which share the host
# kernel). Firecracker gives them VM-grade isolation at container-grade
# density and speed. Open source: github.com/firecracker-microvm/firecracker
