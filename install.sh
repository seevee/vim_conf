#!/usr/bin/env bash
# install and configure neovim

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $REPO_DIR/lib/bash-utils/index.sh

h1 "neovim dotfiles installation"

h1_emphasis "found OS: " "$OSTYPE"
h1_emphasis "found distro: " $(get_linux_distribution)

h1b "installing dependencies..."
install_packages cmake git neovim
success "done"

h1b "symlinking configuration..."
mkdir -p $HOME/.config
overwrite_symlink $REPO_DIR/nvim $HOME/.config/nvim
success "done"

# install Lazy.nvim and sync packages
if command -v nvim &> /dev/null; then
  h1b "installing/updating lazy.nvim and packages..."
  nvim --headless "+Lazy! sync" +qa
  success "done"
else
  err "nvim not found"
fi

h1_success "neovim installation complete"
