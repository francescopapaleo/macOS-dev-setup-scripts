#!/bin/bash

# Initial setup script for Mac OS X 10.13.6
softwareupdate --install --all

# Install Xcode Command Line Tools
sudo xcode-select --install
wait

# bash_profile
echo "export CLICOLOR=1" >> ~/.bash_profile
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile

echo "export TERM="xterm-color"" >> ~/.bash_profile
echo "export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '" >> ~/.bash_profile

exec bash -l

# Install MacPorts
curl -O https://github.com/macports/macports-base/releases/download/v2.8.1/MacPorts-2.8.1-10.13-HighSierra.pkg
wait
current_dir=$(pwd)
sudo installer -pkg "$current_dir/MacPorts-2.8.1-10.13-HighSierra.pkg" -target /
wait

# Install Pyenv
sudo curl https://pyenv.run | bash
wait

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# Restart the shell
exec bash -l

# Install Python 3.9.16
pyenv install 3.9.16 && pyenv global 3.9.16
wait

# Make hidden app translucent in DocK
defaults write com.apple.Dock showhidden -bool YES && killall Dock

# Always show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true && killall Finder

echo "Script complete."
