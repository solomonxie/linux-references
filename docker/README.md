# Progressive Docker Lessons

A step-by-step series learning Docker — the CLI, Dockerfiles, and compose
in depth — through to Podman and the rest of the container tooling
landscape. Every file is named `docker_NN_topic`, with the extension
matching what it actually is: `.sh` for CLI-only steps, `.dockerfile` for
a real Dockerfile, `.yaml` for a real compose file — the explanation
lives as comments inside that real file, not in a wrapping shell script.

Steps:

| Step | Topic |
|---|---|
| 01. cli basics | `docker run/ps/images/logs/exec` |
| 02. dockerfile | a real Dockerfile, commented instruction by instruction |
| 03. dockerfile multistage | a real multi-stage Dockerfile, `.dockerignore` |
| 04. volumes | named volumes and bind mounts |
| 05. networking | user-defined networks, publishing ports |
| 06. compose basics | a real compose file, multi-container apps |
| 07. compose volumes networks | named volumes and custom networks in compose |
| 08. compose env | `environment:`, `env_file:`, `${VAR}` substitution |
| 09. compose advanced | healthchecks, profiles, scaling, override files |
| 10. registry | tagging, `push`/`pull`, a local registry |
| 11. podman | podman as a daemonless, rootless docker alternative |
| 12. other alternatives | advanced: buildah, nerdctl/containerd, colima/lima, Rancher Desktop |

## Reference assets

Real-world files that don't fit the numbered step format:

| File | What it is |
|---|---|
| `get-docker.sh` | official `get.docker.com` install script (vendored) |
| `daemon.json` | `/etc/docker/daemon.json` example — registry mirrors, debug/experimental flags |
| `multipass.md` | spinning up a disposable Ubuntu VM with Multipass to run Docker in |
| `services/plex/` | Plex media server compose file |
| `services/shadowsocks/` | shadowsocks + kcptun + v2ray compose stack |
