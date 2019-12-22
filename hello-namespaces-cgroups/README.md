# Progressive Namespaces & cgroups Lessons

A step-by-step series learning the kernel primitives containers are built
on: namespaces and cgroup v2. Each step is a standalone `ns_NN_topic.sh`.

Steps:

| File | Topic |
|---|---|
| `ns_01_unshare_basics.sh` | `unshare`, isolating a process |
| `ns_02_pid_namespace.sh` | PID namespace, PID 1 inside it |
| `ns_03_net_namespace.sh` | network namespace via `unshare --net` |
| `ns_04_mount_namespace.sh` | mount namespace, `chroot`/`pivot_root` |
| `ns_05_cgroups_v2_basics.sh` | cgroup v2 filesystem, cpu/memory limits |
| `ns_06_build_a_container.sh` | advanced: combining namespaces + cgroups + chroot into a minimal container |

