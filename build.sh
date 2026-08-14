#!/bin/zsh
set -euo pipefail
SCRIPT_DIR="${0:A:h}"
APP="$SCRIPT_DIR/CodexQuota.app"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources" "$SCRIPT_DIR/.module-cache"
clang "$SCRIPT_DIR/Sources/main.m" -o "$APP/Contents/MacOS/CodexQuota" \
  -fobjc-arc -fmodules -fmodules-cache-path="$SCRIPT_DIR/.module-cache" -framework AppKit -framework ServiceManagement
cp "$SCRIPT_DIR/Info.plist" "$APP/Contents/Info.plist"
cp "$SCRIPT_DIR/Assets/CodexQuota.icns" "$APP/Contents/Resources/CodexQuota.icns"
codesign --force --deep --sign - "$APP"
echo "$APP"
