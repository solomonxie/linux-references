#!/usr/bin/env bash
# Run: sh ns_01_unshare_basics.sh (Linux, needs root for most namespace types)
# What this step adds: creating a process in a new set of namespaces.
# Step 1: unshare basics

# Step 1: current process's namespaces, one symlink per type
ls -la /proc/$$/ns

# Step 1: run a shell isolated in a new UTS namespace (hostname is separable)
unshare --uts bash -c 'hostname isolated-host; hostname'
hostname   # unchanged outside the namespace

# Step 1: --fork is needed whenever the namespace type requires a fresh PID 1
unshare --uts --fork bash -c 'hostname ns2; hostname'
