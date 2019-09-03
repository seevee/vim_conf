# vim_conf

[Vim](https://github.com/vim/vim) config files and [Pathogen](https://github.com/tpope/vim-pathogen)-based submodule plugin collection.

Includes [ALE](https://github.com/w0rp/ale) for IDE-like functionality.

Plays well with:
* [tmux](https://github.com/tmux/tmux)
* [tmuxinator](https://github.com/tmuxinator/tmuxinator)
* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Powerline](https://github.com/powerline/powerline).

Tested against Kubuntu 18.04, OSX (requires [Homebrew](https://brew.sh/)); system-agnostic in theory.

## Quirks

2 space tabs, mostly solarized colorscheme.

## Syntax support

* JS/ES6/ES7
  * React, Angular, Vue
  * Node
* HTML/CSS
* C/C++/Obj. C
* Ruby/Rails

## Installation

Execute the install script in the project root:
```
./install.sh
```

## Updates

```
git submodule update --init --recursive
```
