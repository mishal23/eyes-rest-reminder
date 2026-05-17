#!/bin/zsh
set -euo pipefail

AGENT_PATH="$HOME/Library/LaunchAgents/com.mishal.eyerest.plist"
APP_SUPPORT_DIR="$HOME/Library/Application Support/EyeRest"
LABEL="com.mishal.eyerest"

if launchctl print "gui/$(id -u)/$LABEL" >/dev/null 2>&1; then
  launchctl bootout "gui/$(id -u)" "$AGENT_PATH" >/dev/null 2>&1 || true
fi

rm -f "$AGENT_PATH"
rm -rf "$APP_SUPPORT_DIR"

echo "Eye Rest is uninstalled."
