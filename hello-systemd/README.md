# Progressive systemd Lessons

A step-by-step series learning systemd — the init system most non-Alpine
distros use, and the natural counterpart to `alpine/openrc/`. Each step
is a standalone file.

Steps:

| Step | Topic |
|---|---|
| 01 | `systemctl start/stop/status` |
| 02 | `systemctl enable`, targets (systemd's runlevels) |
| 03 | writing a custom `.service` unit |
| 04 | `Wants`/`Requires`/`After`/`Before` |
| 05 | `journalctl` basics |
| 06 | `.timer` units vs cron |
| 07 | advanced: systemd vs OpenRC concept mapping |
