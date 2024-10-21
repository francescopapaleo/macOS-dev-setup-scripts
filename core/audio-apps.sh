#!/bin/bash

echo "Installing Audio Apps..."
brew install --cask reaper
brew install --cask cycling74-max
brew install --cask qlab
# brew install --cask sonic-visualiser
brew install --cask rekordbox
# brew install --cask audacity
brew install --cask freac
brew install --cask ffmpeg

echo "Installing Audio Plugins..."

brew install --cask izotope-product-portal
brew install --cask native-access
brew install --cask waves-central

echo "You will have to manually install the following apps:"
echo "  - Dante Virtual Soundcard"
echo "  - Dante Controller"
echo "  - HOLOPHONIX Native / Designer"
echo "  - HOLOPHONIX Virtual Soundcard"
echo "  - HOLOSCORE"

echo "Installation script completed successfully"