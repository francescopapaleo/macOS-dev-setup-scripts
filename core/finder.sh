#!/bin/bash

# Customizes Finder settings on macOS.

# Show hidden files in Finder and restart Finder to apply.
defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder
echo "Hidden files will now be visible in Finder."

# Show all filename extensions in Finder and restart to apply.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true && killall Finder
echo "Filename extensions will now be shown in Finder."

echo "Finder customization complete."
