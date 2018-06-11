# dotfiles

This repo collects my personal dotfiles for macOS. These dotfiles can
be used on GNU/Linux as well with some minor changes:

- .bashrc
- .bash_profile
- .tmux.conf
- mc.ext
- mc ini file
- rtv.cfg

In addition you can find some very simple tmuxinator config files:

- tmuxinator/*.yml

## Installation

### Clone the repo
```
git clone https://github.com/daviderestivo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule init
git submodule update
git submodule foreach --recursive git checkout master
```
### Install cmake and compile tmux-mem-cpu-load


```
# Install cmake if not done before
brew install cmake

# Compile tmux-mem-cpu-load
cd  ~/.dotfiles/tmux/plugins/tmux-mem-cpu-load
cmake .
make
```


### Link the dotfiles

```
# Move to your homedir
cd ~

# Create directories
mkdir -p ~/.config/mc
mkdir -p ~/.config/rtv

# Backup your current dotfiles
cp ~/.bash_profile ~/.bash_profile.orig
cp ~/.bashrc ~/.bashrc.orig
cp ~/.tmux.conf ~/.tmux.conf.orig
cp ~/.config/mc/ini ~/.config/mc/ini.orig
cp ~/.config/rtv/rtv.cfg ~/.config/rtv/rtv.cfg.orig

# Use the ones provided by this repo
cd ~
ln -sf ~/.dotfiles/bash_profile .bash_profile
ln -sf ~/.dotfiles/bashrc .bashrc
ln -sf ~/.dotfiles/tmux/tmux.conf .tmux.conf
ln -sf ~/.dotfiles/mc/mc.ext .config/mc/mc.ext
ln -sf ~/.dotfiles/mc/ini .config/mc/ini
ln -sf ~/.dotfiles/rtv/rtv.cfg .config/rtv/rtv.cfg
ln -sf ~/.dotfiles/eless/eless ~/bin/eless
```

### Personalize your .bashrc

If you wish to add additional .bashrc related configurations/aliases you can
simply create a new .bashrc_personal:

```
touch  ~/.bashrc_personal
```

and add them there.

### Note for GNU/Linux users

- Please comment out the below line in tmux.conf in case you run tmux
  in GNU/Linux:

  ```
  set -g default-command "reattach-to-user-namespace -l ${SHELL}"
  ```

- Please use the standard mc.ext that comes with Midnight Commander
