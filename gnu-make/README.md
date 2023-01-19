# Progressive Makefile Lessons

A step-by-step series learning GNU Make from first principles up through
advanced usage. Each step is a standalone file — a full copy of the
previous step plus one new concept, runnable on its own via `make -f`.

Steps:

| Step | Topic |
|---|---|
| 01 | targets, prerequisites, recipes |
| 02 | `.PHONY` targets |
| 03 | variables (`=`, `:=`, `?=`, `+=`) |
| 04 | `$@`, `$<`, `$^`, `$?` |
| 05 | pattern rules (`%.o: %.c`) |
| 06 | built-in functions (`wildcard`, `patsubst`, `shell`) |
| 07 | `ifeq`/`ifdef` conditionals |
| 08 | `include`, splitting a project across files |
| 09 | order-only prerequisites (`|`) |
| 10 | generated/automatic dependency tracking (`-MMD`) |
| 11 | recursive make across subdirectories |
| 12 | parallel builds (`-j`), `.NOTPARALLEL` |
| 13 | advanced: `eval`, `call`, generated rules |
| 14 | advanced: self-documenting `make help` targets |
