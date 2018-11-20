# Progressive musl libc Lessons

A step-by-step series learning musl libc — the C standard library Alpine
uses instead of glibc — and where it diverges from what most other
distros assume. Each step is a standalone `musl_NN_topic.sh`.

Steps:

| File | Topic |
|---|---|
| `musl_01_overview.sh` | musl vs glibc, `ldd`/`file` on Alpine binaries |
| `musl_02_static_dynamic.sh` | static vs dynamic linking against musl |
| `musl_03_dns_resolution.sh` | musl's minimal `getaddrinfo`/DNS resolver quirks |
| `musl_04_gcompat.sh` | `gcompat` for running glibc binaries on Alpine |
| `musl_05_segfault_debugging.sh` | debugging crashes caused by musl vs glibc assumptions |
| `musl_06_build_from_source.sh` | advanced: building third-party software against musl |
