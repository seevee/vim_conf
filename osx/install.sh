#!/usr/bin/env bash

# add bash profile if it does not exist
touch $HOME/.bash_profile

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install osx dependencies
brew install cmake git vim python

# re-link python
brew unlink python && brew link python

# install pip
sudo easy_install pip

# install tmuxinator with ruby
gem install tmuxinator
