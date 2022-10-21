#!/usr/bin/env bash
# determine OS and run appropriate dependency installation script

VIM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $VIM_DIR/lib/bash-utils/index.sh

h1 "vim configuration"

DISTRO=$(get_linux_distribution)
h1_emphasis "found OS: " "$OSTYPE"
h1_emphasis "found distro: " "$DISTRO"

h1b "installing dependencies..."
case "$OSTYPE" in
  linux*)
    case "$DISTRO" in
      *ubuntu* | *pop*) source $VIM_DIR/ubuntu/install.sh;;
      *fedora*) source $VIM_DIR/fedora/install.sh;;
      *)        err "unsupported distro: $DISTRO";;
    esac;;
  darwin*)  source $VIM_DIR/osx/install.sh;;
  win*)     err "unsupported OS: $OSTYPE";;
  msys*)    err "unsupported OS: $OSTYPE";;
  cygwin*)  err "unsupported OS: $OSTYPE";;
  bsd*)     err "unsupported OS: $OSTYPE";;
  solaris*) err "unsupported OS: $OSTYPE";;
  *)        err "unknown OS: $OSTYPE";;
esac
success "done"

h1 "executing configuration..."
source $VIM_DIR/configure.sh

h1_success "vim configuration complete"

