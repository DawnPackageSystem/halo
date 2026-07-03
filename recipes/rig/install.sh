#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: rig (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading modern pre-compiled rig binary..."
curl -sL https://github.com/m0nisa/rig/releases/latest/download/rig-linux-amd64 -o rig

echo "[2/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp rig /usr/local/bin/
chmod +x /usr/local/bin/rig

echo "[3/4] Fetching internal asset files if needed..."
mkdir -p /usr/local/share/rig
curl -sL https://raw.githubusercontent.com/m0nisa/rig/master/data/idx.txt -o /usr/local/share/rig/idx.txt

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
