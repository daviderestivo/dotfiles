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
```

### Link them

```
# Move to your homedir
cd ~

# Backup current dotfiles
cp .bash_profile .bash_profile.orig 
cp .bashrc .bashrc.orig
cp .tmux.conf .tmux.conf.orig

# Use the one provided by this repo
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
