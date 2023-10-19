#!/usr/bin/env bash
# Run: sh fc_02_prerequisites_install.sh (Linux + KVM only; needs root for /dev/kvm)
# What this step adds: checking prerequisites and installing the firecracker binary.
# Step 2: prerequisites and install

# Step 2: Firecracker needs KVM -- this only works on Linux with virtualization
# enabled (bare metal, or a cloud instance with nested virt, e.g. AWS
# .metal/.nitro instances)
[ -e /dev/kvm ] && echo "KVM available" || echo "no /dev/kvm -- Firecracker cannot run here"
ls -la /dev/kvm 2>/dev/null

# Step 2: your user needs rw access to /dev/kvm (often via the "kvm" group)
groups | grep -q kvm && echo "in kvm group" || echo "not in kvm group -- may need sudo"

# Step 2: download the static binary release
ARCH=$(uname -m)
RELEASE=$(curl -fsSL "https://api.github.com/repos/firecracker-microvm/firecracker/releases/latest" | grep -m1 tag_name | cut -d'"' -f4)
curl -fsSLO "https://github.com/firecracker-microvm/firecracker/releases/download/${RELEASE}/firecracker-${RELEASE}-${ARCH}.tgz"
tar xzf "firecracker-${RELEASE}-${ARCH}.tgz"
sudo mv "release-${RELEASE}-${ARCH}/firecracker-${RELEASE}-${ARCH}" /usr/local/bin/firecracker
firecracker --version

# Step 2: a boot needs a kernel image (vmlinux) and a root filesystem
# image -- Firecracker publishes ready-made ones for quickstarts
mkdir -p ~/fc_demo && cd ~/fc_demo
curl -fsSLO https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.10/x86_64/vmlinux-5.10.223
curl -fsSLO https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.10/x86_64/ubuntu-22.04.ext4
