# Progressive OpenRC Lessons

A step-by-step series learning OpenRC — the init system Alpine uses
instead of systemd. Each step is a standalone `openrc_NN_topic.sh`.

Steps:

| File | Topic |
|---|---|
| `openrc_01_service_basics.sh` | `rc-service`, `rc-status` |
| `openrc_02_runlevels.sh` | `rc-update add/del`, default runlevel |
| `openrc_03_custom_init_script.sh` | writing a custom `/etc/init.d` script |
| `openrc_04_dependencies.sh` | `need`/`use`/`after` service dependencies |
| `openrc_05_vs_systemd.sh` | advanced: OpenRC vs systemd unit conversion patterns |
