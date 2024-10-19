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

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed!"
fi

# Install essential tools
echo "Installing essential tools with Homebrew..."
brew install wget
brew install tree
brew install curl

echo "Installation and configuration completed successfully!"
