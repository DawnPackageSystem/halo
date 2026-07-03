#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: fortune (Bare-Metal Script & Data Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/3] Downloading portable fortune implementation..."
curl -sL https://raw.githubusercontent.com/bmc/fortune/master/fortune -o fortune

echo "[2/3] Deploying script to system local binary path (/usr/local/bin)..."
cp fortune /usr/local/bin/
chmod +x /usr/local/bin/fortune

echo "[3/3] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
