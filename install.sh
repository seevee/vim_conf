#!/usr/bin/env bash
# determine OS and run appropriate dependency installation script

VIM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $VIM_DIR/lib/bash-utils/index.sh

h1 "vim/nvim dotfiles installation"

h1_emphasis "found OS: " "$OSTYPE"
h1_emphasis "found distro: " $(get_linux_distribution)

h1b "installing dependencies..."
install_packages cmake git neovim
success "done"

h1b "sylminking configuration..."
overwrite_symlink $VIM_DIR $HOME/.vim
overwrite_symlink $VIM_DIR/vimrc $HOME/.vimrc
mkdir -p $HOME/.config
overwrite_symlink $VIM_DIR/nvim $HOME/.config/nvim
success "done"

# install vim-plug and packages
if command -v vim &> /dev/null; then
  h1b "installing/updating vim-plug and packages..."

  vim +PlugUpgrade +PlugInstall +PlugUpdate +CocUpdate +qall

  success "done"
else
  h2 "vim not found"
fi
# install Lazy.nvim and sync packages
if command -v nvim &> /dev/null; then
  h1b "installing/updating lazy.nvim and packages..."

  nvim --headless "+Lazy! sync" +qa

  success "done"
else
  h2 "nvim not found"
fi

h1_success "vim/neovim installation complete"
