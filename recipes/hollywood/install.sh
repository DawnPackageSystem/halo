#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: hollywood (Bare-Metal Script Bundle)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Fetching standalone hollywood orchestration script..."
curl -sL https://raw.githubusercontent.com/dustinkirkland/hollywood/master/bin/hollywood -o hollywood

echo "[2/4] Deploying script to system local binary path (/usr/local/bin)..."
cp hollywood /usr/local/bin/
chmod +x /usr/local/bin/hollywood

echo "[3/4] Ensuring basic core dependencies are available..."
mkdir -p /usr/lib/hollywood

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
