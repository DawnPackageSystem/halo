#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: docker-compose (Bare-Metal Binary Pull)"
echo "===================================================="

echo "[1/2] Downloading latest pre-compiled docker-compose binary from GitHub..."
curl -sL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose

echo "[2/2] Adjusting permissions for execution layer..."
chmod +x /usr/local/bin/docker-compose

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
