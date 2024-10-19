#!/bin/bash

echo "Installing packages..."


brew install pyenv


echo "Installing apps from homebrew/cask..."

brew install --cask visual-studio-code
brew install --cask rar
brew install --cask qlmarkdown
brew install --cask angry-ip-scanner
# brew install --cask mysqlworkbench
# brew install --cask qjackctl
# brew install --cask filezilla
# brew install --cask sourcetree

# brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask dropbox
# brew install --cask slack
# brew install --cask zoom
# brew install --cask whatsapp
# brew install --cask telegram
brew install --cask discord
# brew install --cask notion
# brew install --cask zotero
# brew install --cask soulseek
brew install --cask anydesk
brew install --cask vlc
# brew install --cask spotify
brew install --cask obs
# brew install --cask blender
# brew install --cask gimp
# brew install --cask keepassxc

echo "Installation script completed successfully"