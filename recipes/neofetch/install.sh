#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: neofetch (Bare-Metal Script Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/3] Downloading official neofetch artifact from GitHub..."
curl -sL https://raw.githubusercontent.com/dylanaraps/neofetch/master/neofetch -o neofetch

echo "[2/3] Deploying script to system local binary path (/usr/local/bin)..."
cp neofetch /usr/local/bin/
chmod +x /usr/local/bin/neofetch

echo "[3/3] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
