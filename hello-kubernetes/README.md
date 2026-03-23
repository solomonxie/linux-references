# Progressive Kubernetes Lessons

A step-by-step series learning Kubernetes — kubectl, the core object
manifests, Helm, and Kustomize — through to local cluster tooling,
troubleshooting, and sidecar containers. Every file is named
`k8s_NN_topic`, with the extension matching what it actually is: `.sh`
for CLI-only steps, `.yaml` for a real manifest — the explanation lives
as comments inside that real file.

Steps:

| Step | Topic |
|---|---|
| 01. kubectl basics | `kubectl get/describe/logs/delete`, namespaces |
| 02. pod | a real Pod manifest, the smallest deployable unit |
| 03. deployment | replicas, rolling updates, `kubectl scale`/`rollout` |
| 04. service | stable virtual IP/DNS in front of a Deployment's Pods |
| 05. configmap secret | injecting config and secrets into Pods |
| 06. volumes pvc | persistent storage via PersistentVolumeClaim |
| 07. namespaces resources | namespace isolation, ResourceQuota |
| 08. ingress | HTTP(S) routing into the cluster by host/path |
| 09. helm basics | installing/upgrading charts, scaffolding your own |
| 10. helm chart templates | Chart.yaml/values.yaml/templates — Go-templating steps 2-4 |
| 11. kustomize | patching manifests per environment without templating |
| 12. local clusters | advanced: kind vs minikube vs k3s/k3d vs Docker/Rancher Desktop |
| 13. troubleshooting | advanced: `describe`/`logs`/`exec`/`port-forward`, a debug pod |
| 14. sidecar containers | multi-container Pods, and how service mesh sidecar injection extends the pattern |
