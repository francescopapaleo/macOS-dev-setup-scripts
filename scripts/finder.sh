!#/bin/bash

# Always show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true && killall Finder

echo "Script complete."
