#!/usr/bin/env bash
# update and install vim + packages

# create symbolic links, overwrite old vim configuration
overwrite_symlink $VIM_DIR $HOME/.vim
overwrite_symlink $VIM_DIR/vimrc $HOME/.vimrc

# install vim-plug and packages
vim +PlugInstall +qall

