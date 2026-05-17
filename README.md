# Eye Rest

A tiny macOS reminder that prompts you every 30 minutes to rest your eyes for 30 seconds.

## Install

```sh
./install.sh
```

macOS may ask you to allow notifications from Script Editor or osascript the first time it runs.

## Test The Reminder

```sh
./scripts/eye-rest.sh
```

## Stop Reminders

```sh
./uninstall.sh
```

## How It Works

- `scripts/eye-rest.sh` shows a notification and a dialog that automatically closes after 30 seconds.
- `install.sh` copies the runnable script to `~/Library/Application Support/EyeRest/eye-rest.sh` and installs a user LaunchAgent at `~/Library/LaunchAgents/com.mishal.eyerest.plist`.
- The LaunchAgent runs every `1800` seconds, which is 30 minutes.
