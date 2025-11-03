#!/bin/bash
# ============================================
# Install Docker Engine on Debian (Official)
# ============================================

set -e

echo ">>> Updating system packages..."
sudo apt-get update -y

echo ">>> Installing prerequisites..."
sudo apt-get install -y ca-certificates curl

echo ">>> Creating keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo ">>> Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc

echo ">>> Setting permissions for Docker GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo ">>> Adding Docker repository to Apt sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo \"${VERSION_CODENAME}\") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo ">>> Updating package index..."
sudo apt-get update -y

echo ">>> Installing Docker Engine, CLI, Containerd, Buildx, and Compose..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo ">>> Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo ">>> Docker sukses di install!"
echo ">>> coba: docker --version"
