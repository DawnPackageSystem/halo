#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: Google Chrome (Bare-Metal Deb Surgery)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/5] Downloading latest Google Chrome production package..."
curl -sL "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -o chrome.deb

echo "[2/5] Extracting payload via binary surgery..."
ar x chrome.deb
tar -xf data.tar.xz

echo "[3/5] Deploying browser assets to system layer..."
rm -rf /opt/google/chrome
mkdir -p /opt/google
cp -r opt/google/chrome /opt/google/
ln -sf /opt/google/chrome/google-chrome /usr/local/bin/google-chrome

echo "[4/5] Deploying system-wide desktop shortcut and icons..."
mkdir -p /usr/share/icons/hicolor/product_logo_256/apps
cp opt/google/chrome/product_logo_256.png /usr/share/icons/hicolor/product_logo_256/apps/google-chrome.png

cat << 'EOF' > /usr/share/applications/google-chrome-dawn.desktop
[Desktop Entry]
Name=Google Chrome (DAWN)
Comment=Web Browser deployed via DAWN Engine
Exec=/usr/local/bin/google-chrome --no-sandbox %U
Terminal=false
Type=Application
Icon=/usr/share/icons/hicolor/product_logo_256/apps/google-chrome.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;
EOF

chmod +x /usr/share/applications/google-chrome-dawn.desktop

echo "[5/5] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
