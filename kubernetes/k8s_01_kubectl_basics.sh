#!/usr/bin/env bash
# Run: sh k8s_01_kubectl_basics.sh (needs a cluster: minikube/kind/k3s/Docker Desktop — see step 12)
# What this step adds: core kubectl verbs.
# Step 1: kubectl basics

kubectl version --client
kubectl cluster-info
kubectl get nodes

# Step 1: create, inspect, and remove a Pod without a manifest file
kubectl run demo --image=nginx:alpine --restart=Never
kubectl get pods
kubectl describe pod demo
kubectl logs demo
kubectl delete pod demo

# Step 1: everything in k8s lives in a namespace
kubectl get namespaces
kubectl get pods -n kube-system | head -5
