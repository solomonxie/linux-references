# Progressive apk (Alpine Package Keeper) Lessons

A step-by-step series learning Alpine's `apk` package manager from basics
through advanced usage. Each step is a standalone `apk_NN_topic.sh` — a
full copy of the previous step plus one new concept.

Planned steps (not yet written):

| File | Topic |
|---|---|
| `apk_01_install_remove.sh` | `apk add`, `apk del`, `apk upgrade` |
| `apk_02_search_info.sh` | `apk search`, `apk info` |
| `apk_03_repositories.sh` | `apk update`, `/etc/apk/repositories`, edge/testing |
| `apk_04_virtual_packages.sh` | `apk add --virtual` for disposable build deps |
| `apk_05_cache.sh` | local package cache, `--no-cache`, offline installs |
| `apk_06_fix_verify.sh` | `apk fix`, `apk verify`, package integrity |
| `apk_07_world_pinning.sh` | `/etc/apk/world`, pinning versions |
| `apk_08_build_local.sh` | advanced: building/installing a local package with `abuild` |
| `apk_09_custom_repo.sh` | advanced: hosting/using a custom apk repository |

TODO: write each step per the progressive-learning convention.
