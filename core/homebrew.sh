#!/bin/bash

echo "Initial setup script for Mac OSX"

# # Ask the user if they want to run softwareupdate
# echo "Do you want to run softwareupdate to install the latest updates? (yes/no)"
# read response

# if [[ "$response" == "yes" ]]; then
#     echo "Running softwareupdate --install --all..."
#     softwareupdate --install --all
# else
#     echo "Skipping softwareupdate."
# fi

# Check if xcode command line tools are installed
if ! xcode-select --print-path &> /dev/null; then
    echo "Xcode Command Line Tools not found, installing..."
    sudo xcode-select --install
else
    echo "Xcode Command Line Tools are already installed!"
fi

# Check if the installation was successful
if ! xcode-select --print-path &> /dev/null; then
    echo "Xcode Command Line Tools installation failed. Exiting..."
    exit 1
fi

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
