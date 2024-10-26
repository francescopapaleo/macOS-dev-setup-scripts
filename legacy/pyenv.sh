#!/bin/bash

# Check if Pyenv is already installed
if ! command -v pyenv &> /dev/null; then
    echo "Pyenv not found, installing..."
    brew install pyenv
else
    echo "Pyenv is already installed!"
fi

echo "Adding Pyenv init to .bash_profile if not already present..."

# Add Pyenv initialization to .bash_profile only if it's not already there
if ! grep -q 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bash_profile; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
    echo "Pyenv initialization added to .bash_profile."
else
    echo "Pyenv initialization already exists in .bash_profile."
fi

# Reload the shell to apply changes
source ~/.bash_profile

# Check if Python 3.10 is already installed
if ! pyenv versions | grep -q '3.11'; then
    echo "Installing Python 3.11..."
    pyenv install 3.11
    pyenv global 3.11
    echo "Python 3.11 installed and set as global."
else
    echo "Python 3.11 is already installed!"
fi

echo "Pyenv setup complete!"
