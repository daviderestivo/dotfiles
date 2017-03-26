# dotfiles

This repo collects my personal dofiles:
- .bashrc
- .bash_profile
- .tmux.conf

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

### Link them

```
# Move to your homedir
cd ~

# Backup your current dotfiles
cp .bash_profile .bash_profile.orig 
cp .bashrc .bashrc.orig
cp .tmux.conf .tmux.conf.orig

# Use the ones provided by this repo
ln -s .dotfiles/bash_profile .bash_profile
ln -s .dotfiles/bashrc .bashrc
ln -s .dotfiles/tmux/tmux.conf .tmux.conf
```

### Personalize your .bashrc

If you wish to add additional .bashrc related configurations/aliases you can
simply create a new:

```
touch  ~/.bashrc_personal
```

and add them there.
