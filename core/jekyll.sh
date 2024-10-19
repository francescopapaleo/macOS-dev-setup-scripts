#!/bin/bash

echo "This script installs jekyll on your system"
echo "Please make sure you have homebrew installed"
echo "More info: https://jekyllrb.com/docs/installation/macos/"

brew install chruby ruby-install xz

ruby-install ruby 3.1.3

echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile
echo "chruby ruby-3.1.3" >> ~/.bash_profile

source ~/.bash_profile

ruby -v

echo "Installing jekyll..."

sudo gem install jekyll
