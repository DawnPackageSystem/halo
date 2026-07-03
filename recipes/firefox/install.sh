#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: Firefox Web Browser (Bare-Metal Bundle)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/5] Downloading latest Firefox Linux 64-bit binaries from Mozilla (en-US)..."
curl -sL "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -o firefox.tar.bz2

echo "[2/5] Extracting payload to /opt system directory..."
tar -xjf firefox.tar.bz2
rm -rf /opt/firefox
cp -r firefox /opt/
ln -sf /opt/firefox/firefox /usr/local/bin/firefox

echo "[3/5] Fetching official high-resolution application icon..."
curl -sL "https://raw.githubusercontent.com/mozilla/browser-styles/master/test/assets/firefox-logo.png" -o /opt/firefox/browser/chrome/icons/default/default128.png

echo "[4/5] Constructing system-wide desktop shortcut deployment..."
cat << 'EOF' > /usr/share/applications/firefox-dawn.desktop
[Desktop Entry]
Name=Firefox (DAWN)
Comment=Web Browser deployed via DAWN Engine
Exec=/usr/local/bin/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;
EOF

chmod +x /usr/share/applications/firefox-dawn.desktop

echo "[5/5] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
