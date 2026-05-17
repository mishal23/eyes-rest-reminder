#!/bin/zsh
set -euo pipefail

APP_NAME="Eye Rest"
MESSAGE="Look away from the screen and blink slowly for 30 seconds."
SOUND_NAME="Glass"

/usr/bin/osascript <<APPLESCRIPT
display notification "$MESSAGE" with title "$APP_NAME" subtitle "30-second break" sound name "$SOUND_NAME"

try
  display dialog "$MESSAGE" buttons {"Done"} default button "Done" with title "$APP_NAME" giving up after 30
end try
APPLESCRIPT
