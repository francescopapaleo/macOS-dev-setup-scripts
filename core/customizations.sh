#!/bin/bash
set -e  # Stop script on any error

echo "Adding custom settings to .bash_profile"

# Check if .bash_profile exists, if not create it
if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile
fi

# Add custom settings
echo "export CLICOLOR=1" >> ~/.bash_profile
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile
echo "export TERM=xterm-color" >> ~/.bash_profile
echo "export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '" >> ~/.bash_profile

echo "Custom settings added to .bash_profile"

# Apply Finder preferences
echo "Applying Finder preferences..."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"  # List view
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Restart Finder to apply changes
killall Finder
echo "Finder customization complete."

# Restart bash session
exec bash -l
