#!/bin/bash

# Initial setup script for Mac OS X 10.13.6
softwareupdate --install --all

# Install Xcode Command Line Tools
sudo xcode-select --install
wait

# Prevents Mac OS from blocking certain apps from being run
sudo spctl --master-disable         

# bash_profile
echo "export CLICOLOR=1" >> ~/.bash_profile
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile

echo "export TERM="xterm-color"" >> ~/.bash_profile
echo "export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '" >> ~/.bash_profile

exec bash -l

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Pyenv
brew install pyenv pyenv-virtualenv
wait

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# Restart the shell
exec bash -l

# Always show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true && killall Finder

echo "Script complete."
