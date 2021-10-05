#!/usr/bin/env bash
# provide some markup-style formatting for terminal output

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/terminal_control.sh

BULLET="↳"
CHECK="✓"
INFO="🛈"
X="⨯"

h1 () {
  printf "\n${Cyan}$1${Rst}\n"
}

h1_emphasis () {
  printf "\n"
  printf ${Cyan}
  printf "$1"
  printf ${Yellow}
  printf "$2"
  printf ${Cyan}
  printf "$3"
  printf ${Rst}
  printf "\n"
}

h1_success () {
  printf "\n${Green}$1${Rst}\n"
}

h1b () {
  printf ${Cyan}
  printf "$BULLET "
  printf "${Blue}$1${Rst}\n"
}

h2 () {
  printf ${Yellow}
  printf "$INFO "
  printf "${Yellow}$1${Rst}\n"
}

success () {
  printf "${Green}$CHECK $1${Rst}\n"
}

err () {
  printf "${Red}$X $1${Rst}\n"
}

