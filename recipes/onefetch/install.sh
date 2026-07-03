#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: onefetch (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled official Linux binary from GitHub..."
curl -sL https://github.com/o2sh/onefetch/releases/latest/download/onefetch-linux-x86-64.tar.gz -o onefetch.tar.gz

echo "[2/4] Extracting payload..."
tar -xzf onefetch.tar.gz

echo "[3/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp onefetch /usr/local/bin/
chmod +x /usr/local/bin/onefetch

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
