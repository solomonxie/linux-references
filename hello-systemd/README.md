# Progressive systemd Lessons

A step-by-step series learning systemd — the init system most non-Alpine
distros use, and the natural counterpart to `alpine/hello-openrc.sh`.
Each step is a standalone file.

Steps:

| Step | Topic |
|---|---|
| 01. unit basics | `systemctl start/stop/status` |
| 02. enable targets | `systemctl enable`, targets (systemd's runlevels) |
| 03. custom unit | writing a custom `.service` unit |
| 04. dependencies | `Wants`/`Requires`/`After`/`Before` |
| 05. journald | `journalctl` basics |
| 06. timers | `.timer` units vs cron |
| 07. vs openrc | advanced: systemd vs OpenRC concept mapping |
