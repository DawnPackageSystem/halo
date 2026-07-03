#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: cmatrix (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled static cmatrix binary..."
curl -sL https://github.com/abishekvashok/cmatrix/releases/download/v2.0/cmatrix-static-amd64 -o cmatrix

echo "[2/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp cmatrix /usr/local/bin/
chmod +x /usr/local/bin/cmatrix

echo "[3/4] Validating local binary state..."
/usr/local/bin/cmatrix -V

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
