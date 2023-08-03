#!/usr/bin/env bash
# install and configure neovim

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "$REPO_DIR"/lib/bash-utils/index.sh

h1 "neovim dotfiles"

h1_emphasis "found OS: " "$OSTYPE"
h1_emphasis "found distro: " "$(get_linux_distribution)"

h1 "dependencies"
h1a "installing via package manager"
install_packages neovim

if ! command -v nvim &> /dev/null; then
  err "\`nvim\` not found"
  exit 1
else
  success "done"
fi

h1 "configuration"
mkdir -p "$HOME"/.config
h1a "linking $REPO_DIR/nvim/ to ~/.config/nvim/"
overwrite_symlink "$REPO_DIR"/nvim "$HOME"/.config/nvim
success "done"

h1a "installing lazy.nvim and packages"
nvim --headless "+Lazy! sync" +qa
success "done"

h1_success "neovim installation complete"
