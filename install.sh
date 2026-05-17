#!/bin/zsh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_SCRIPT_PATH="$ROOT_DIR/scripts/eye-rest.sh"
APP_SUPPORT_DIR="$HOME/Library/Application Support/EyeRest"
SCRIPT_PATH="$APP_SUPPORT_DIR/eye-rest.sh"
TEMPLATE_PATH="$ROOT_DIR/launchagents/com.mishal.eyerest.plist"
AGENT_DIR="$HOME/Library/LaunchAgents"
AGENT_PATH="$AGENT_DIR/com.mishal.eyerest.plist"
LABEL="com.mishal.eyerest"

chmod +x "$SOURCE_SCRIPT_PATH"
mkdir -p "$APP_SUPPORT_DIR"
cp "$SOURCE_SCRIPT_PATH" "$SCRIPT_PATH"
chmod +x "$SCRIPT_PATH"
mkdir -p "$AGENT_DIR"
sed "s#__SCRIPT_PATH__#$SCRIPT_PATH#g" "$TEMPLATE_PATH" > "$AGENT_PATH"

if launchctl print "gui/$(id -u)/$LABEL" >/dev/null 2>&1; then
  launchctl bootout "gui/$(id -u)" "$AGENT_PATH" >/dev/null 2>&1 || true
fi

launchctl bootstrap "gui/$(id -u)" "$AGENT_PATH"
launchctl enable "gui/$(id -u)/$LABEL"
launchctl kickstart -k "gui/$(id -u)/$LABEL"

echo "Eye Rest is installed. You will get a 30-second rest reminder every 30 minutes."
echo "To stop it, run: $ROOT_DIR/uninstall.sh"
