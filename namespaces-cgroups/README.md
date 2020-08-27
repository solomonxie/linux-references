# Progressive Namespaces & cgroups Lessons

A step-by-step series learning the kernel primitives containers are built
on: namespaces and cgroup v2. Each step is a standalone file.

Steps:

| Step | Topic |
|---|---|
| 01. unshare basics | `unshare`, isolating a process |
| 02. pid namespace | PID namespace, PID 1 inside it |
| 03. net namespace | network namespace via `unshare --net` |
| 04. mount namespace | mount namespace, `chroot`/`pivot_root` |
| 05. cgroups v2 basics | cgroup v2 filesystem, cpu/memory limits |
| 06. build a container | advanced: combining namespaces + cgroups + chroot into a minimal container |
