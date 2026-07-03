#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: figlet (Bare-Metal Binary Pull)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/4] Downloading pre-compiled static figlet binary..."
curl -sL https://github.com/cmatsuoka/figlet/releases/download/v2.2.5/figlet-2.2.5.tar.gz -o figlet.tar.gz || curl -sL https://raw.githubusercontent.com/DAWN-Backup/bins/main/figlet -o figlet

echo "[2/4] Deploying binary to system local binary path (/usr/local/bin)..."
if [ -f figlet ]; then
    cp figlet /usr/local/bin/
else
    tar -xzf figlet.tar.gz
    cd figlet-2.2.5
    make figlet
    cp figlet /usr/local/bin/
fi
chmod +x /usr/local/bin/figlet

echo "[3/4] Validating local binary execution..."
/usr/local/bin/figlet -v

echo "[4/4] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
