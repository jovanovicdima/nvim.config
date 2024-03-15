# dima's nvim config
This is dima's nvim config dotfiles.

## Installation

### Clone this repository
Clone this repository in `~/.config` folder. Git is going to create new `nvim/` folder with all config files.

### Install wbthomason/packer.nvim
To be able to install all nvim plugins from this config, packer is needed.
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Install plugins
Open nvim and run `:PackerSync`. If it fails, run `:PackerSync` again.
