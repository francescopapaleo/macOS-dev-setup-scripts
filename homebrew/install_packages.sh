#!/bin/bash

echo "Installing packages..."

brew install wget
brew install pyenv
brew install tree
brew install curl

echo "Installing apps from homebrew/cask..."

brew install --cask visual-studio-code
brew install --cask rar
brew install --cask qlmarkdown
brew install --cask qjackctl

brew install --cask firefox
brew install --cask google-drive
brew install --cask dropbox

# brew install --cask slack
brew install --cask zoom
# brew install --cask whatsapp
# brew install --cask telegram
brew install --cask discord
# brew install --cask notion
brew install --cask zotero
# brew install --cask soulseek
brew install --cask obs

brew install --cask spotify
brew install --cask vlc
brew install --cask freac

# brew install --cask sonic-visualiser
brew install --cask reaper

echo "Installation script completed successfully"