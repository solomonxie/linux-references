# Progressive Makefile Lessons

A step-by-step series learning GNU Make from first principles up through
advanced usage. Each step is a standalone file — a full copy of the
previous step plus one new concept, runnable on its own via `make -f`.

Steps:

| Step | Topic |
|---|---|
| 01. basic | targets, prerequisites, recipes |
| 02. phony | `.PHONY` targets |
| 03. variables | variables (`=`, `:=`, `?=`, `+=`) |
| 04. automatic vars | `$@`, `$<`, `$^`, `$?` |
| 05. pattern rules | pattern rules (`%.o: %.c`) |
| 06. functions | built-in functions (`wildcard`, `patsubst`, `shell`) |
| 07. conditionals | `ifeq`/`ifdef` conditionals |
| 08. multi file | `include`, splitting a project across files |
| 09. order only | order-only prerequisites (`|`) |
| 10. auto deps | generated/automatic dependency tracking (`-MMD`) |
| 11. recursive make | recursive make across subdirectories |
| 12. parallel | parallel builds (`-j`), `.NOTPARALLEL` |
| 13. eval call | advanced: `eval`, `call`, generated rules |
| 14. self documenting | advanced: self-documenting `make help` targets |
