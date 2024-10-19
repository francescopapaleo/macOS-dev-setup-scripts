#!/bin/bash

# Ensure the script uses the directory it's located in as the working directory
SCRIPT_DIR=$(dirname "$0")
cd "$SCRIPT_DIR"

# Call core scripts
./core/homebrew.sh
./core/pyenv.sh

./core/customizations.sh

./core/vscode.sh

./core/casks.sh
./core/audio-apps.sh

echo "Setup complete!"
