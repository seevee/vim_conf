#!/usr/bin/env bash

# determine OS and run appropriate dependency installation script

DOTFILES=$PWD

case "$OSTYPE" in
  linux*)   source $DOTFILES/ubuntu/install.sh;;
  darwin*)  source $DOTFILES/osx/install.sh;;
  win*)     echo "Unsupported OS: $OSTYPE";;
  msys*)    echo "Unsupported OS: $OSTYPE";;
  cygwin*)  echo "Unsupported OS: $OSTYPE";;
  bsd*)     echo "Unsupported OS: $OSTYPE";;
  solaris*) echo "Unsupported OS: $OSTYPE";;
  *)        echo "Unknown OS: $OSTYPE";;
esac

echo "configuring vim..."
source $DOTFILES/configure.sh
