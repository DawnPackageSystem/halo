#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: Visual Studio Code (Bare-Metal Bundle)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/5] Downloading latest VS Code Linux 64-bit binaries from Microsoft..."
curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -o vscode.tar.gz

echo "[2/5] Extracting payload to /opt system directory..."
tar -xzf vscode.tar.gz
rm -rf /opt/vscode
mkdir -p /opt/vscode
cp -r VSCode-linux-x64/* /opt/vscode/
ln -sf /opt/vscode/bin/code /usr/local/bin/code

echo "[3/5] Fetching official high-resolution application icon..."
mkdir -p /usr/share/icons/hicolor/512x512/apps
cp /opt/vscode/resources/app/resources/linux/code.png /usr/share/icons/hicolor/512x512/apps/vscode.png

echo "[4/5] Constructing system-wide desktop shortcut deployment..."
cat << 'EOF' > /usr/share/applications/vscode-dawn.desktop
[Desktop Entry]
Name=Visual Studio Code (DAWN)
Comment=Code Editing. Redefined via DAWN Engine.
Exec=/usr/local/bin/code --no-sandbox --unity-launch %F
Terminal=false
Type=Application
Icon=/usr/share/icons/hicolor/512x512/apps/vscode.png
Categories=Development;TextEditor;Utility;
MimeType=text/plain;inode/directory;
Actions=new-empty-window;
EOF

chmod +x /usr/share/applications/vscode-dawn.desktop

echo "[5/5] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
