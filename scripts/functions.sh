#!/usr/bin/env bash
# basic functions

# clean overwrite
# $1:symlink
# $2:destination
overwrite_symlink () {
  unlink $2 || rm -rf $2
  ln -fns $1 $2
}

# $1:file
# $2:add string
# $3:check string
append_if_not_exists () {
  grep -q "$2" "$1" || echo "$3" >> "$1"
}


# $1:add string
# $2:check string (optional, defaults to add string)
append_rc () {
  append_if_not_exists $HOME/.bashrc $1 ${2:$1}
  append_if_not_exists $HOME/.zshrc $1 ${2:$1}
}

get_linux_distribution () {
  # From terdon on SO: https://askubuntu.com/a/459425/548109
  # Determine OS platform
  UNAME=$(uname | tr "[:upper:]" "[:lower:]")
  # If Linux, try to determine specific distribution
  if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
      echo $(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | tr "[:upper:]" "[:lower:]")
      # Otherwise, use release info file
    else
      echo $(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | \
	grep -v "lsb" | \
	cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1 | \
	tr "[:upper:]" "[:lower:]")
    fi
  else
    # For everything else (or if above failed), just use generic identifier
    echo $UNAME
  fi
  unset UNAME
}

