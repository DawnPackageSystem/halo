#!/bin/bash
set -e

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT LAYER ENGINE STARTED"
echo "Target Package: Sublime Text (Bare-Metal Bundle)"
echo "===================================================="

WORK_DIR=$(mktemp -d)
cd "$WORK_DIR"

echo "[1/5] Downloading latest Sublime Text Linux 64-bit tarball..."
curl -sL "https://download.sublimetext.com/sublime_text_build_4180_x64.tar.xz" -o sublime.tar.xz

echo "[2/5] Extracting payload to /opt system directory..."
tar -xf sublime.tar.xz
rm -rf /opt/sublime_text
cp -r sublime_text /opt/
ln -sf /opt/sublime_text/sublime_text /usr/local/bin/subl

echo "[3/5] Deploying system-wide icons..."
mkdir -p /usr/share/icons/hicolor/128x128/apps
cp /opt/sublime_text/Icon/128x128/sublime-text.png /usr/share/icons/hicolor/128x128/apps/sublime-text.png

echo "[4/5] Constructing system-wide desktop shortcut deployment..."
cat << 'EOF' > /usr/share/applications/sublime-text-dawn.desktop
[Desktop Entry]
Name=Sublime Text (DAWN)
Comment=Sophisticated text editor for code, markup and prose
Exec=/usr/local/bin/subl %F
Terminal=false
Type=Application
Icon=/usr/share/icons/hicolor/128x128/apps/sublime-text.png
Categories=Development;TextEditor;
MimeType=text/plain;
EOF

chmod +x /usr/share/applications/sublime-text-dawn.desktop

echo "[5/5] Cleaning up volatile installation artifacts..."
cd /
rm -rf "$WORK_DIR"

echo "===================================================="
echo "DAWN UNIVERSAL DEPLOYMENT SUCCESSFUL!"
echo "===================================================="
