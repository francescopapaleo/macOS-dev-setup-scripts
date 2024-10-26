#!/bin/bash
set -e

echo "Initial setup script for Mac OSX"

# Ensure the script uses the directory it's located in as the working directory
SCRIPT_DIR=$(dirname "$0")
cd "$SCRIPT_DIR"

sudo -v

# Check if xcode command line tools are installed
if ! xcode-select --print-path &> /dev/null; then
    echo "Xcode Command Line Tools not found, installing..."
    sudo xcode-select --install
else
    echo "Xcode Command Line Tools are already installed!"
fi

# Check if the installation was successful
if ! xcode-select --print-path &> /dev/null; then
    echo "Xcode Command Line Tools installation failed."
fi

# Determine Homebrew path for compatibility with Apple Silicon
BREW_PATH="/usr/local/bin/brew"
if [ -d "/opt/homebrew/bin" ]; then
    BREW_PATH="/opt/homebrew/bin/brew"
fi

# Check if Homebrew is installed
if ! command -v "$BREW_PATH" &> /dev/null; then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed!"
fi

# Essential tools
echo "Installing essential tools with Homebrew..."
$BREW_PATH install wget tree curl

## Check for pyenv
if ! command -v pyenv &> /dev/null; then
    echo "Installing Pyenv..."
    $BREW_PATH install pyenv
else
    echo "Pyenv is already installed!"
fi

# Configure .bash_profile for pyenv
if ! grep -q 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bash_profile; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
    echo "Pyenv initialization added to .bash_profile."
else
    echo "Pyenv initialization already exists in .bash_profile."
fi

# Install Python 3.12
if ! pyenv versions | grep -q '3.12'; then
    echo "Installing Python 3.12..."
    pyenv install 3.12
    pyenv global 3.12
    echo "Python 3.12 installed and set as global."
else
    echo "Python 3.12 is already installed!"
fi

# Custom bash settings
if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile
fi

echo "Adding custom settings to .bash_profile"
echo "export CLICOLOR=1" >> ~/.bash_profile
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile
echo "export TERM=xterm-color" >> ~/.bash_profile
echo "export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '" >> ~/.bash_profile
chsh -s /bin/bash
echo "Custom settings added to .bash_profile"

# Finder preferences
echo "Applying Finder preferences..."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder
echo "Finder customization complete."

# Install VS Code and restore settings if files exist
$BREW_PATH install --cask visual-studio-code
if [ -f "./preferences/vscode/settings.json" ]; then
    cp ./preferences/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
fi
if [ -f "./preferences/vscode/keybindings.json" ]; then
    cp ./preferences/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
fi

# Install VS Code extensions
echo "Installing VS Code extensions..."
if [ -f "./preferences/vscode/extensions.list" ]; then
    while read extension; do
        code --install-extension "$extension"
    done < ./preferences/vscode/extensions.list
fi

# Install Homebrew applications
echo "Installing apps from Homebrew..."
$BREW_PATH install --cask rar mist qlmarkdown angry-ip-scanner mysqlworkbench firefox google-chrome google-drive dropbox whatsapp telegram discord zotero anydesk vlc spotify obs

# Audio Applications and Plugins
echo "Installing Audio Apps and Plugins..."
$BREW_PATH install --cask reaper cycling74-max qlab rekordbox freac ffmpeg izotope-product-portal native-access waves-central ilok-license-manager

echo "Please install the following manually:"
echo "  - Dante Virtual Soundcard"
echo "  - Dante Controller"
echo "  - HOLOPHONIX Native / Designer"
echo "  - HOLOPHONIX Virtual Soundcard"
echo "  - HOLOSCORE"

echo "Setup complete!"