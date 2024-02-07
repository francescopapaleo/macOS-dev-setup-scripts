#!/bin/bash

echo "Initial setup script for Mac OSX"

# Ask the user if they want to run softwareupdate
echo "Do you want to run softwareupdate to install the latest updates? (yes/no)"
read response

if [[ "$response" == "yes" ]]; then
    echo "Running softwareupdate --install --all..."
    softwareupdate --install --all
else
    echo "Skipping softwareupdate."
fi

echo "Install Xcode Command Line Tools"
sudo xcode-select --install
# It's good practice to not automatically wait after sudo commands, as they might require user interaction.

echo "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
