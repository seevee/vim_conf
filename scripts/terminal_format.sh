#!/usr/bin/env bash
# provide some markup-style formatting for terminal output

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/terminal_control.sh

BULLET="↳"
CHECK="✓"
INFO="🛈"
X="⨯"
STAR="★ "
SYMBOL="꧂ "

h1 () {
  printf "\n\
${Cyan}$SYMBOL \
${Cyan}$1\
${Rst}\n"
}

h1_emphasis () {
  printf "\n\
${Cyan}$SYMBOL \
${Cyan}$1\
${Yellow}$2\
${Cyan}$3\
${Rst}\n"
}

h1_success () {
  printf "\n\
${Green}$STAR \
${Green}$1 \
${Rst}\n"
}

h1b () {
  printf "\
${Cyan}$BULLET \
${Blue}$1\
${Rst}\n"
}

h2 () {
  printf "\
${Yellow}$INFO \
${Yellow}$1 \
${Rst}\n"
}

success () {
  printf "\
${Green}$CHECK \
${Green}$1\
${Rst}\n"
}

err () {
  printf "\
${Red}$X \
${Red}$1\
${Rst}\n"
}

