# Progressive musl libc Lessons

musl libc — the C standard library Alpine uses instead of glibc, and
where it diverges from what most other distros assume — in one file:
`musl-libc.sh`, sectioned with `----- N. topic -----` markers.

Sections:

| # | Topic |
|---|---|
| 1 | musl vs glibc, `ldd`/`file` on Alpine binaries |
| 2 | static vs dynamic linking against musl |
| 3 | musl's minimal `getaddrinfo`/DNS resolver quirks |
| 4 | `gcompat` for running glibc binaries on Alpine |
| 5 | debugging crashes caused by musl vs glibc assumptions |
| 6 | advanced: building third-party software against musl |
