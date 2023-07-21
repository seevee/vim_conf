#!/usr/bin/env bash
# install and update vim/neovim + packages

h1 "vim/nvim configuration"
# create symbolic links, overwrite old vim configuration
overwrite_symlink $VIM_DIR $HOME/.vim
overwrite_symlink $VIM_DIR/vimrc $HOME/.vimrc

# install vim-plug and packages
VIMS=("vim" "nvim")
for VIM in "${VIMS[@]}"; do
  if ! command -v $VIM &> /dev/null; then
    h1b "skipping $VIM..."
  else
    h1b "installing/updating plugins for $VIM..."
    $VIM +PlugUpgrade +PlugInstall +PlugUpdate +CocUpdate +qall
  fi
done

CONFIG=$HOME/.config
mkdir -p $CONFIG
SOURCES=("nvim")
for SOURCE in "${SOURCES[@]}"; do
  h1b "linking $VIM_DIR/$SOURCE to $CONFIG/$SOURCE..."
  overwrite_symlink $VIM_DIR/$SOURCE $CONFIG/$SOURCE
done

success "done"
