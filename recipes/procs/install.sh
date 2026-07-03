#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: procs (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled official Linux binary from GitHub..."
curl -sL https://github.com/dalance/procs/releases/latest/download/procs-v0.14.9-x86_64-lnx.zip -o procs.zip

echo "[2/4] Extracting payload..."
unzip -q procs.zip

echo "[3/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp procs /usr/local/bin/
chmod +x /usr/local/bin/procs

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
