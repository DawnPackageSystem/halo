#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: lolcat (Bare-Metal Optimized Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled fast C-implementation of lolcat..."
curl -sL https://github.com/jaseg/lolcat/releases/download/v1.4/lolcat-linux-amd64 -o lolcat

echo "[2/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp lolcat /usr/local/bin/
chmod +x /usr/local/bin/lolcat

echo "[3/4] Validating local binary execution..."
/usr/local/bin/lolcat -h > /dev/null

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
