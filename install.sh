#!/usr/bin/env bash
# determine OS and run appropriate dependency installation script

VIM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $VIM_DIR/scripts/terminal_format.sh
source $VIM_DIR/scripts/functions.sh

h1 "vim configuration"

DISTRO=$(get_linux_distribution)
h1_emphasis "found OS: " "$OSTYPE"
h1_emphasis "found distro: " "$DISTRO"

h1b "installing dependencies..."
case "$OSTYPE" in
  linux*)
    if [[ "$DISTRO" == *"ubuntu"* ]]; then
      printf ${Rst}
      source $VIM_DIR/ubuntu/install.sh
    elif [[ $DISTRO == *"fedora"* ]]; then
      printf ${Rst}
      source $VIM_DIR/fedora/install.sh
    elif [[ $DISTRO == *"arch"* ]]; then
      printf ${Rst}
    else
      printf "unsupported distro: $DISTRO\n\n"
      printf ${Rst}
      exit
    fi;;
  darwin*)  printf ${Rst} && source $VIM_DIR/osx/install.sh;;
  win*)     printf "unsupported OS: $OSTYPE\n\n";;
  msys*)    printf "unsupported OS: $OSTYPE\n\n";;
  cygwin*)  printf "unsupported OS: $OSTYPE\n\n";;
  bsd*)     printf "unsupported OS: $OSTYPE\n\n";;
  solaris*) printf "unsupported OS: $OSTYPE\n\n";;
  *)        printf "unknown OS: $OSTYPE\n\n";;
esac
success "done"

h1 "executing configuration..."
source $VIM_DIR/configure.sh

h1_success "vim configuration complete"

