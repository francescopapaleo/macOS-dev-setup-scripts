#!/bin/bash

echo "Installing Pyenv..."
brew install pyenv
wait

echo "Adding Pyenv init to .bash_profile..."

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

# Restart the shell
source ~/.bash_profile

echo "Installation and configuration completed successfully!"
