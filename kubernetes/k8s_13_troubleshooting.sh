#!/usr/bin/env bash
# Run: sh k8s_13_troubleshooting.sh (needs a cluster; applies/removes step 3's Deployment)
# What this step adds: advanced — diagnosing a misbehaving workload.
# Step 13: troubleshooting

kubectl apply -f k8s_03_deployment.yaml

# Step 13: why isn't a pod starting? — events at the bottom are usually the answer
kubectl describe pod -l app=demo | tail -20

# Step 13: logs, including a previous crashed instance
kubectl logs -l app=demo --tail 50
kubectl logs -l app=demo --previous 2>/dev/null || echo "(no previous crash to show)"

# Step 13: exec into a running container, same idea as `docker exec`
kubectl exec -it deploy/demo -- sh -c 'echo hi from inside'

# Step 13: forward a local port straight to a pod, bypassing any Service
kubectl port-forward deploy/demo 8080:80 &
sleep 1; curl -s localhost:8080 | head -3; kill %1

# Step 13: a temporary debug pod with common troubleshooting tools
kubectl run debug --rm -it --image=busybox --restart=Never -- sh -c 'wget -qO- http://demo'

kubectl delete -f k8s_03_deployment.yaml
