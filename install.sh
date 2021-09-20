#!/usr/bin/env bash
# determine OS and run appropriate dependency installation script

VIM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $VIM_DIR/scripts/terminal_control.sh

# From terdon on SO: https://askubuntu.com/a/459425/548109
# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
  # If available, use LSB to identify distribution
  if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
    export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | tr "[:upper:]" "[:lower:]")
  # Otherwise, use release info file
  else
    export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1 | tr "[:upper:]" "[:lower:]")
  fi
fi
# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
unset UNAME

# install dotfiles from within this script's working dir
case "$OSTYPE" in
  linux*)
    if [[ "$DISTRO" == *"ubuntu"* ]]; then
      printf ${Rst}
      source $VIM_DIR/ubuntu/install.sh
    elif [[ $DISTRO == *"fedora"* ]]; then
      printf ${Rst}
      source $VIM_DIR/fedora/install.sh
    else
      printf "unsupported Distro: $DISTRO\n\n"
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

printf ${Rst}
printf "\n"
source $VIM_DIR/configure.sh

printf "\n"
printf ${Green}
printf "vim configuration installed"
printf ${Rst}
printf "\n\n"

