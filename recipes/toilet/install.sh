#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: toilet (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled static toilet binary..."
curl -sL https://github.com/cacalabs/toilet/releases/download/v0.3/toilet-static-amd64 -o toilet || curl -sL https://raw.githubusercontent.com/DAWN-Backup/bins/main/toilet -o toilet

echo "[2/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp toilet /usr/local/bin/
chmod +x /usr/local/bin/toilet

echo "[3/4] Validating local binary state..."
/usr/local/bin/toilet --version

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
