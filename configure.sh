#!/usr/bin/env bash
# install and update vim/neovim + packages

# create symbolic links, overwrite old vim configuration
overwrite_symlink $VIM_DIR $HOME/.vim
overwrite_symlink $VIM_DIR/vimrc $HOME/.vimrc

# install vim-plug and packages
vim +PlugUpgrade +PlugInstall +PlugUpdate +CocUpdate +qall
nvim +PlugUpgrade +PlugInstall +PlugUpdate +CocUpdate +qall

