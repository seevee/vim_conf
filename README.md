# neovim dotfiles

[neovim](https://github.com/neovim/neovim):
* [lazy.nvim](https://github.com/folke/lazy.nvim) package management
* Using treesitter, lsp-zero, oil, telescope, trouble, and more

## Target Systems

Currently tested against EndeavourOS and Pop! OS

Previously tested against:
* Kubuntu 22.10
* macOS (requires [Homebrew](https://brew.sh/))

## Quirks

2 space tabs, gruvbox theme

## Installation

This project uses git submodules, so make sure you clone appropriately:

```sh
git clone https://github.com/seevee/vim_conf.git --recurse-submodules
```

Then do EITHER:
* install `neovim` and copy/symlink/etc. `nvim/` to `~/.config/nvim/`
* execute the install script in the project root:
```sh
./install.sh
```

> **Warning**
> `./install.sh` will overwrite `~/.config/nvim` with a symlink
