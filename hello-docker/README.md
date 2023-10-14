# Progressive Docker Lessons

A step-by-step series learning Docker — the CLI, Dockerfiles, compose,
registries — through to Podman and the rest of the container tooling
landscape. Steps that are just CLI usage are shell scripts; steps about a
config format (a Dockerfile, a compose file) are that real format, with
the explanation as comments inside it — not a shell script generating one.

Steps:

| Step | Topic |
|---|---|
| 01. cli basics | `docker run/ps/images/logs/exec` |
| 02. dockerfile basics | a real `Dockerfile`, commented instruction by instruction |
| 03. multistage builds | a real multi-stage `Dockerfile`, `.dockerignore` |
| 04. volumes | named volumes and bind mounts |
| 05. networking | user-defined networks, publishing ports |
| 06. compose | a real `compose.yaml`, multi-container apps |
| 07. registry | tagging, `push`/`pull`, a local registry |
| 08. podman | podman as a daemonless, rootless docker alternative |
| 09. other alternatives | advanced: buildah, nerdctl/containerd, colima/lima, Rancher Desktop |
