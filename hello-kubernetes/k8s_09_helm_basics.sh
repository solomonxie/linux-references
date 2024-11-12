#!/usr/bin/env bash
# Run: sh k8s_09_helm_basics.sh
# What this step adds: Helm — a package manager for Kubernetes manifests
# (a "chart" bundles templated YAML + default values, roughly steps 2-8
# combined and parameterized).
# Step 9: helm basics

helm version
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Step 9: install a published chart
helm install my-nginx bitnami/nginx --set service.type=ClusterIP
helm list
helm status my-nginx

# Step 9: upgrade in place, then roll back if needed
helm upgrade my-nginx bitnami/nginx --set replicaCount=3
helm rollback my-nginx 1

helm uninstall my-nginx

# Step 9: scaffold your own chart (Chart.yaml, values.yaml, templates/)
helm create my-chart
