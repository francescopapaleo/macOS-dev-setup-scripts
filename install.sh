#!/bin/bash

# Ensure the script uses the directory it's located in as the working directory
SCRIPT_DIR=$(dirname "$0")
cd "$SCRIPT_DIR"

# Call core scripts
./core/homebrew.sh
./core/pyenv.sh

echo "Applying Finder preferences from finder_preferences.plist..."
defaults import com.apple.finder ./preferences/finder_preferences.plist
killall Finder
echo "Finder preferences applied and Finder restarted."

echo "Applying Terminal preferences from terminal_preferences.plist..."
open ./preferences/terminal_preferences.plist
echo "Terminal preferences applied."

./core/vscode.sh

./core/casks.sh
./core/audio-apps.sh

echo "Setup complete!"
