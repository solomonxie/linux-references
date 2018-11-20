# Progressive Makefile Lessons

A step-by-step series learning GNU Make from first principles up through
advanced usage. Each step is a standalone `Makefile_NN_topic.mk` — a full
copy of the previous step plus one new concept, runnable on its own via
`make -f Makefile_NN_topic.mk`.

Steps:

| File | Topic |
|---|---|
| `Makefile_01_basic.mk` | targets, prerequisites, recipes |
| `Makefile_02_phony.mk` | `.PHONY` targets |
| `Makefile_03_variables.mk` | variables (`=`, `:=`, `?=`, `+=`) |
| `Makefile_04_automatic_vars.mk` | `$@`, `$<`, `$^`, `$?` |
| `Makefile_05_pattern_rules.mk` | pattern rules (`%.o: %.c`) |
| `Makefile_06_functions.mk` | built-in functions (`wildcard`, `patsubst`, `shell`) |
| `Makefile_07_conditionals.mk` | `ifeq`/`ifdef` conditionals |
| `Makefile_08_multi_file.mk` | `include`, splitting a project across files |
| `Makefile_09_order_only.mk` | order-only prerequisites (`|`) |
| `Makefile_10_auto_deps.mk` | generated/automatic dependency tracking (`-MMD`) |
| `Makefile_11_recursive_make.mk` | recursive make across subdirectories |
| `Makefile_12_parallel.mk` | parallel builds (`-j`), `.NOTPARALLEL` |
| `Makefile_13_eval_call.mk` | advanced: `eval`, `call`, generated rules |
| `Makefile_14_self_documenting.mk` | advanced: self-documenting `make help` targets |

Run any step with `make -f <file>` (e.g. `make -f Makefile_09_order_only.mk`).
