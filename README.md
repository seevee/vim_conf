# Vim/neovim dotfiles

Configuration for [neovim](https://github.com/neovim/neovim)

Includes configuration for [Vim](https://github.com/vim/vim)(currently unused):
* [Vim-Plug](https://github.com/junegunn/vim-plug) package management
* [ALE](https://github.com/w0rp/ale) for IDE-like functionality

## Target Systems
Currently tested against EndeavourOS and Pop! OS

Previously Tested against:
* Kubuntu 22.10
* MacOS (requires [Homebrew](https://brew.sh/)).

## Quirks

2 space tabs, gruvbox theme.

## Installation

Do EITHER:
* move `vimrc`, `coc*`, `nvim/`, etc. as desired
* execute the install script in the project root:
```
./install.sh
```

**Warning**
The script will overwrite the following locations with symlinks:
* `~/.vim`
* `~/.vimrc`
* `~/.config/nvim`
