#!/usr/bin/env bash

# update and install vim + packages

VIM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# create symbolic links, overwrite old vim configuration
rm -rf $HOME/.vim
ln -fns $VIM_DIR $HOME/.vim
ln -fs $VIM_DIR/vimrc $HOME/.vimrc

# install vim-plug and packages
vim +PlugInstall +qall

