#!/usr/bin/env bash
# install and update vim/neovim + packages

# create symbolic links, overwrite old vim configuration
overwrite_symlink $VIM_DIR $HOME/.vim
overwrite_symlink $VIM_DIR/vimrc $HOME/.vimrc

# install vim-plug and packages
vim +PlugUpgrade +PlugInstall +PlugUpdate +CocUpdate +qall
nvim +PlugUpgrade +PlugInstall +PlugUpdate +CocUpdate +qall

h1 "nvim"
CONFIG=$HOME/.config
mkdir -p $CONFIG
h1b "linking configuration..."
SOURCES=("nvim")
for SOURCE in "${SOURCES[@]}"; do
  h1b "linking $VIM_DIR/$SOURCE to $CONFIG/$SOURCE"
  overwrite_symlink $VIM_DIR/$SOURCE $CONFIG/$SOURCE
done
success "done"
