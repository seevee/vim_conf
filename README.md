#vim_conf

VIM config files and Pathogen-based submodule plugin collection.

Includes YouCompleteMe for IDE-like functionality.

Plays well with tmux and tmuxinator.

##Quirks

2 space tabs, solarized colorscheme, 

##Syntax support

* JS/ES6
* C#
* C/C++/Obj. C
* Ruby
* ReactJS
* Coffeescript
* HTML/CSS

##Ubuntu Installation

Install dependencies for YouCompleteMe (YCM):
```
sudo apt install cmake build-essential python-dev python3-dev
```
Install complete system mono for mono developer tools (xbuild):
```
sudo apt install mono-complete
```

Install official [mono](http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives) for YCM C# support:
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
```

###Language Servers
These can be done individually as a sanity check, else they are done with the following section's script call.
C# server:
```
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/OmniSharpServer
xbuild
```

JS server:
```
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
npm install --production
```

###Final Step
Compile YCM with semantic support for C-family languages, C#, and JavaScript:
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --omnisharp-completer --tern-completer
```

##Updates

```
git submodule update --init --recursive
```
