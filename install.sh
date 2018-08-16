#!/usr/bin/env bash

# determine OS and run appropriate dependency installation script

VIM_DIR=$PWD

case "$OSTYPE" in
  linux*)   source $VIM_DIR/ubuntu/install.sh;;
  darwin*)  source $VIM_DIR/osx/install.sh;;
  win*)     echo "Unsupported OS: $OSTYPE";;
  msys*)    echo "Unsupported OS: $OSTYPE";;
  cygwin*)  echo "Unsupported OS: $OSTYPE";;
  bsd*)     echo "Unsupported OS: $OSTYPE";;
  solaris*) echo "Unsupported OS: $OSTYPE";;
  *)        echo "Unknown OS: $OSTYPE";;
esac

echo "configuring vim..."
source $VIM_DIR/configure.sh
