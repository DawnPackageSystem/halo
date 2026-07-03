#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: ripgrep (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled official Linux binary from GitHub..."
LATEST_URL=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep "browser_download_url.*x86_64-unknown-linux-musl.tar.gz" | head -n 1 | cut -d '"' -f 4)
curl -sL "$LATEST_URL" -o ripgrep.tar.gz

echo "[2/4] Extracting payload..."
tar -xzf ripgrep.tar.gz
cd ripgrep-*-x86_64-unknown-linux-musl

echo "[3/4] Deploying binary to system local binary path (/usr/local/bin)..."
cp rg /usr/local/bin/
chmod +x /usr/local/bin/rg

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
