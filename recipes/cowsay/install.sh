#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: cowsay (Bare-Metal Execution Layer)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/3] Downloading standalone cowsay script..."
curl -sL https://raw.githubusercontent.com/ things/cowsay/master/cowsay -o cowsay || curl -sL https://raw.githubusercontent.com/moxiegirl/cowsay/master/cowsay -o cowsay

echo "[2/3] Deploying script to system local binary path (/usr/local/bin)..."
cp cowsay /usr/local/bin/
chmod +x /usr/local/bin/cowsay

echo "[3/3] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
