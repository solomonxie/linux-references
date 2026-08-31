# Progressive systemd Lessons

A step-by-step series learning systemd — the init system most non-Alpine
distros use, and the natural counterpart to `os-alpine/hello-openrc.sh`.
CLI-only steps are shell scripts; a step about a unit file is a real
`.service`/`.timer` file, with the explanation as comments inside it.

Steps:

| Step | Topic |
|---|---|
| 01. unit basics | `systemctl start/stop/status` |
| 02. enable targets | `systemctl enable`, targets (systemd's runlevels) |
| 03. custom unit | a real `.service` unit file |
| 04. dependencies | `Wants`/`Requires`/`After`/`Before` in a unit file |
| 05. journald | `journalctl` basics |
| 06. timers | a real `.service` + `.timer` pair, systemd's alternative to cron |
| 07. vs openrc | advanced: systemd vs OpenRC concept mapping |
