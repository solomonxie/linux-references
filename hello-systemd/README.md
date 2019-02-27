# Progressive systemd Lessons

A step-by-step series learning systemd — the init system most non-Alpine
distros use, and the natural counterpart to `alpine/openrc/`. Each step
is a standalone `systemd_NN_topic.sh`.

Planned steps (not yet written):

| File | Topic |
|---|---|
| `systemd_01_unit_basics.sh` | `systemctl start/stop/status` |
| `systemd_02_enable_targets.sh` | `systemctl enable`, targets (systemd's runlevels) |
| `systemd_03_custom_unit.sh` | writing a custom `.service` unit |
| `systemd_04_dependencies.sh` | `Wants`/`Requires`/`After`/`Before` |
| `systemd_05_journald.sh` | `journalctl` basics |
| `systemd_06_timers.sh` | `.timer` units vs cron |
| `systemd_07_vs_openrc.sh` | advanced: systemd vs OpenRC concept mapping |

TODO: write each step per the progressive-learning convention.
