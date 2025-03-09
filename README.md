# dotfiles

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

This repository contains my personal dotfiles for macOS. With a few
minor modifications, they can also be used on GNU/Linux.

## Present software
- bash [[Link](https://www.gnu.org/software/bash)]
- bash-completion@2 [[Link](https://github.com/scop/bash-completion)]
- bat [[Link](https://github.com/sharkdp/bat)]
- coreutils [[Link](https://github.com/coreutils/coreutils)]
- cowsay-ng (Optional) [[Link](https://github.com/daviderestivo/cowsay-ng)]
- diffutils [[Link](https://www.gnu.org/software/diffutils)]
- eless [[Link](https://eless.scripter.co)]
- emacs [[Link](https://github.com/emacs-mirror/emacs)]
- fd [[Link](https://github.com/sharkdp/fd)]
- ffmpeg [[Link](https://ffmpeg.org/)]
- font-symbols-only-nerd-font [[Link](https://github.com/ryanoasis/nerd-fonts)]
- fortune-mod (Optional) [[Link](https://github.com/shlomif/fortune-mod)]
- fzf [[Link](https://github.com/junegunn/fzf)]
- fzf-git [[Link](https://github.com/junegunn/fzf-git.sh)]
- grep [[Link](https://www.gnu.org/software/grep)]
- iTerm2 [[Link](https://www.iterm2.com)]
- imagemagick [[Link](https://imagemagick.org/index.php)]
- jq [[Link](https://jqlang.github.io/jq/)]
- magit (via emacs) [[Link](https://magit.vc)]
- midnight-commander [[Link](https://midnight-commander.org)]
- oh-my-bash [[Link](https://github.com/ohmybash/oh-my-bash)]
- poppler [[Link](https://poppler.freedesktop.org/)]
- reattach-to-user-namespace [[Link](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)]
- ripgrep [[Link](https://github.com/BurntSushi/ripgrep)]
- rtv [[Link](https://github.com/michael-lazar/rtv)]
- ruby [[Link](https://www.ruby-lang.org)]
- sevenzip [[Link](https://7-zip.org)]
- tabby [[Link](https://github.com/Eugeny/tabby)]
- the_silver_searcher [[Link](https://geoff.greer.fm/ag/)]
- tmux [[Link](https://github.com/tmux/tmux)]
- tmux-mem-cpu-load [[Link](https://github.com/thewtex/tmux-mem-cpu-load)]
- tmuxinator [[Link](https://github.com/tmuxinator/tmuxinator)]
- tmuxinator-completion [[Link](https://github.com/tmuxinator/tmuxinator)]
- tree [[Link](https://oldmanprogrammer.net/source.php?dir=projects/tree)]
- yazi [[Link](https://github.com/sxyazi/yazi)]
- yazi's nightfly theme [[Link](https://github.com/tkapias/nightfly.yazi.git)]
- yazi's moonfly theme [Link](https://github.com/tkapias/moonfly.yazi)]
- yazi's varoius themes [[Link](https://github.com/yazi-rs/flavors.git)]
- yazi's everforest-medium theme [[Link](https://github.com/Chromium-3-Oxide/everforest-medium.yazi.git)]
- zoxide [[Link](https://github.com/ajeetdsouza/zoxide)]

## Installation
### Clone the repo
``` bash
git clone --depth 1 https://github.com/daviderestivo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule init
git submodule update
git submodule foreach --recursive git checkout master
```

### Install required fonts
Intall DejaVuSansMono fonts: https://dejavu-fonts.github.io/Download.html
Intall DejaVuSansMonoPowerline fonts: https://github.com/powerline/fonts/tree/master/DejaVuSansMono

### Install cmake and compile tmux-mem-cpu-load
``` bash
# Install cmake if not done before
brew install cmake

# Compile tmux-mem-cpu-load
cd  ~/.dotfiles/tmux/plugins/tmux-mem-cpu-load
cmake .
make
```

### Install Emacs (only if interested in magit)
Emacs is required in order to use magit from console.

``` bash
brew tap daviderestivo/emacs-head
brew install emacs-head@31 --with-cocoa
```

![Magit](https://raw.githubusercontent.com/daviderestivo/dotfiles/master/screenshots/magit.png)

### Install required packages

``` bash
brew install bash bash-completion@2 ruby tmux \
    reattach-to-user-namespace midnight-commander \
    the_silver_searcher tmuxinator-completion coreutils \
    grep tree bat diffutils yazi ffmpeg sevenzip jq \
    poppler fd ripgrep fzf zoxide imagemagick \
    font-symbols-only-nerd-font

# Cowsay-ng (Optional)
brew tap daviderestivo/homebrew-cowsay-ng
brew install cowsay-ng

# Fortune-mod (Optional)
brew tap daviderestivo/fortune-mod
brew install fortune-mod --with-offensive --with-fortune-mod-it --with-fortune-mod-woody-allen-it

# Install terminals (you can choose between iTerm or tabby)
brew install --cask tabby iterm2@beta

# Install tmuxinator
gem install tmuxinator
```

### Link the dotfiles
``` bash
# Move to your homedir
cd ~

# Create directories
mkdir -p ~/bin
mkdir -p ~/.config/bat
mkdir -p ~/.config/mc
mkdir -p ~/.config/rtv

# Backup your current dotfiles
cp ~/.bash_profile ~/.bash_profile.orig
cp ~/.bashrc ~/.bashrc.orig
cp ~/.tmux.conf ~/.tmux.conf.orig
cp ~/.config/mc/ini ~/.config/mc/ini.orig
cp ~/.config/rtv/rtv.cfg ~/.config/rtv/rtv.cfg.orig
cp ~/.config/bat/config ~/.config/bat/config.orig
cp ~/Library/Application\ Support/tabby/config.yaml ~/Library/Application\ Support/tabby/config.yaml.orig

# Use the ones provided by this repo
cd ~
ln -sf ~/.dotfiles/bash_profile .bash_profile
ln -sf ~/.dotfiles/bashrc .bashrc
ln -sf ~/.dotfiles/bat/config .config/bat/config
ln -sf ~/.dotfiles/tmux/tmux.conf .tmux.conf
ln -sf ~/.dotfiles/mc/mc.ext .config/mc/mc.ext
ln -sf ~/.dotfiles/mc/ini .config/mc/ini
ln -sf ~/.dotfiles/rtv/rtv.cfg .config/rtv/rtv.cfg
ln -sf ~/.dotfiles/eless/eless ~/bin/eless
ln -sf ~/.dotfiles/edit/edit ~/bin/edit
ln -sf ~/.dotfiles/tabby/config.yaml ~/Library/Application\ Support/tabby/config.yaml
ln -sf ~/.dotfiles/yazi ~/.config/yazi
```

### Configure iTerm2
Open iTerm2 settings and in the "General" section toggle "Load preferences from
a custom folder or URL" and choose "~/.dotfiles/iterm2" as folder location.

### Personalize your .bashrc
If you wish to add additional .bashrc related configurations/aliases you can
simply create a new .bash_personal:

``` bash
touch  ~/.bash_personal
```

and add them there.

### Note for GNU/Linux users
- Please comment out the below line in tmux.conf in case you run tmux
  in GNU/Linux:

  ``` bash
  set -g default-command "reattach-to-user-namespace -l ${SHELL}"
  ```

- Please use the standard mc.ext that comes with Midnight Commander
