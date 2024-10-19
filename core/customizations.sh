#!/bin/bash

echo "Adding custom settings to .bash_profile"

# bash_profile
echo "export CLICOLOR=1" >> ~/.bash_profile
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile

echo "export TERM="xterm-color"" >> ~/.bash_profile
echo "export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '" >> ~/.bash_profile

exec bash -l

echo "Custom settings added to .bash_profile"