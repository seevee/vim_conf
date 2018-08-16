#!/usr/bin/env bash

# update and install vim + packages

VIM_DIR=$PWD

git submodule update --init --recursive

### VIM

# install YouCompleteMe
cd $VIM_DIR/bundle/YouCompleteMe
alias python=python3
/usr/bin/env python3 ./install.py --clang-completer --tern-completer
cd $VIM_DIR

# install vimproc
cd $VIM_DIR/bundle/vimproc.vim
make
cd $VIM_DIR

# create symbolic links, overwrite old vim configuration
rm -rf $HOME/.vim
ln -fns $VIM_DIR $HOME/.vim
ln -fs $VIM_DIR/vimrc $HOME/.vimrc
