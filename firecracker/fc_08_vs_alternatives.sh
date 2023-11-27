#!/usr/bin/env sh
# Run: sh fc_08_vs_alternatives.sh (reference notes, not meant to fully execute)
# What this step adds: advanced -- Firecracker vs the rest of the sandboxing landscape.
# Step 8: Firecracker vs alternatives

# Step 8: gVisor -- a userspace kernel that intercepts syscalls (via ptrace
# or KVM) instead of booting a real guest kernel; runs as a normal
# container runtime (`runsc`, a swap-in for runc), no /dev/kvm required,
# but a wider syscall-compatibility surface to maintain than Firecracker's
# "just run a real Linux kernel" approach

# Step 8: Kata Containers -- also VM-based like Firecracker, but aimed at
# being a drop-in OCI/Kubernetes runtime (via a containerd shim); can use
# Firecracker, QEMU, or Cloud Hypervisor as its actual VMM underneath

# Step 8: Cloud Hypervisor -- a sibling project to Firecracker (same
# rust-vmm crates), aimed at a broader device model (e.g. vfio passthrough)
# for cases that outgrow Firecracker's intentionally minimal one

# Step 8: kern (see hello-kern) and plain namespaces+cgroups (see
# hello-namespaces-cgroups) stay in the "shared host kernel" tier --
# faster to start than any VM-based option, but a kernel 0-day is a
# cross-tenant escape in a way it structurally can't be with a microVM

# Step 8: where each is actually used --
#   AWS Lambda/Fargate         -- Firecracker
#   Google Cloud Run/GKE Sandbox -- gVisor
#   some multi-tenant Kubernetes -- Kata Containers
#   CI runners, agent code exec  -- plain containers/kern, same-tenant
#                                    isolation is enough there
