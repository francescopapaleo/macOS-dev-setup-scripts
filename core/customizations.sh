#!/bin/bash
set -e  # Stop script on any error

echo "Adding custom settings to .bash_profile"

# Check if .bash_profile exists, if not create it
if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile
fi

echo "export CLICOLOR=1" >> ~/.bash_profile
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile
echo "export TERM=xterm-color" >> ~/.bash_profile
echo "export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '" >> ~/.bash_profile

chsh -s /bin/bash

echo "Custom settings added to .bash_profile"

echo "Applying Finder preferences..."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"  # List view
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show desktop items
echo "Setting Finder to show all items on the desktop..."
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Show items in the Finder sidebar
echo "Adding items to Finder sidebar..."

# Add hard drives to sidebar
defaults write com.apple.sidebarlists systemitems -dict-add ShowEjectables -bool true
defaults write com.apple.sidebarlists systemitems -dict-add ShowRemovable -bool true
defaults write com.apple.sidebarlists systemitems -dict-add ShowHardDisks -bool true
defaults write com.apple.sidebarlists networkbrowser -dict-add Computer -bool true

sudo defaults write com.apple.sidebarlists favoritesitems -array-add '<dict><key>Name</key><string>Computer</string><key>Visibility</key><string>AlwaysVisible</string></dict>'

# Add Home Folder to sidebar
defaults write com.apple.sidebarlists favoritesitems -array-add '<dict><key>Name</key><string>Home</string><key>Visibility</key><string>AlwaysVisible</string></dict>'

defaults write com.apple.sidebarlists favoritesitems -array-add '<dict><key>CustomListItems</key><array>
    <dict>
        <key>Name</key><string>Desktop</string>
    </dict>
    <dict>
        <key>Name</key><string>Documents</string>
    </dict>
    <dict>
        <key>Name</key><string>Downloads</string>
    </dict>
</array></dict>'

# Restart Finder to apply changes
killall Finder
echo "Finder customization complete."

# Restart bash session
exec bash -l
