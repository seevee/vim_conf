#!/usr/bin/env bash

# add bash profile if it does not exist
touch $HOME/.bash_profile

# install homebrew
which -s brew
if [[ $? != 0 ]] ; then
    /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

# install osx dependencies
brew install cmake git vim neovim

