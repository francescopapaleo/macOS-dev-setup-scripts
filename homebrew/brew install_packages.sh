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
brew install --cask filezilla
brew install --cask sourcetree


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
brew install --cask anydesk

brew install --cask spotify
brew install --cask vlc

brew install --cask freac
brew install --cask obs

# brew install --cask sonic-visualiser
brew install --cask reaper
brew install --cask cycling74-max

echo "You will have to manually install the following apps:"
echo "  - Dante Virtual Soundcard"
echo "  - Dante Controller"
echo "  - HOLOPHONIX Native / Designer"
echo "  - HOLOPHONIX Virtual Soundcard"
echo "  - HOLOSCORE"

echo "Installation script completed successfully"