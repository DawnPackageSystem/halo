#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: eza (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled official Linux binary from GitHub..."
curl -sL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -o eza.tar.gz

echo "[2/4] Extracting payload..."
tar -xzf eza.tar.gz

echo "[3/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp eza /usr/local/bin/
chmod +x /usr/local/bin/eza

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
