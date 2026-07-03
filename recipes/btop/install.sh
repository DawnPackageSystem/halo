#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: btop (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled official Linux binary from GitHub..."
curl -sL https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz -o btop.tbz

echo "[2/4] Extracting payload..."
tar -xjf btop.tbz

echo "[3/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp btop/bin/btop /usr/local/bin/
chmod +x /usr/local/bin/btop

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
