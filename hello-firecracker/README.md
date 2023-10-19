# Progressive Firecracker Lessons

A step-by-step series learning [Firecracker](https://github.com/firecracker-microvm/firecracker),
the KVM-based microVM engine behind AWS Lambda and Fargate — a real VM
security boundary at close to container speed and density. Configuration
is via curl calls to a JSON HTTP API over a unix socket, so every step is
a shell script; steps that are reference-only (not meant to run against a
live cluster/host) say so in their header.

Steps:

| Step | Topic |
|---|---|
| 01. overview | microVM vs container vs full VM, why AWS built it |
| 02. prerequisites install | `/dev/kvm`, the `firecracker` binary, a kernel + rootfs image |
| 03. boot first microvm | booting a guest via the HTTP API |
| 04. networking | a host TAP device, attached as the guest's network interface |
| 05. jailer | sandboxing the Firecracker process itself (chroot, seccomp, cgroups) |
| 06. snapshotting | pause/resume, snapshot/restore — the serverless warm-start trick |
| 07. rate limiters resources | vCPU/memory caps, I/O and network rate limiters |
| 08. vs alternatives | advanced: gVisor, Kata Containers, Cloud Hypervisor, kern |
