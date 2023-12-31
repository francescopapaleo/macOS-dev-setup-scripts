#!/bin/bash

# Initial setup script for Mac OS X 10.13.6
softwareupdate --install --all

# Install Xcode Command Line Tools
sudo xcode-select --install
wait

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"