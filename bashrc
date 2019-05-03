# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Set colorful PS1
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# Colored ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Timestamps in Bash history
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# Setting locale: en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Avoid cowsay for ansible
export ANSIBLE_NOCOWS=1

# Homebrew's formulae puts executables in /usr/local/bin and /usr/local/sbin
# Add both bin dirs to the PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add ~/bin and ~/.local/bin/ to the PATH
export PATH="~/.local/bin:~/bin:$PATH"

# Add ruby bin dir to the PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add TMUX Plugin Manager bin dir to the PATH
export PATH="~/.dotfiles/tmux/plugins/tpm/bin:$PATH"

# Add mactex bin dir to the PATH
export PATH="/Library/TeX/texbin/:$PATH"

# Add python2 bin dir to the PATH
export PATH="/usr/local/opt/python@2/bin:$PATH"

# Set EDITOR
export EDITOR="emacs"

##################
# BASH FUNCTIONS #
##################

# Helper functions used to upgrade Python 2/3 packages
pip_list_outdated() {
    if [ "X$1" = "X" ]; then
	echo "A simple bash function to list all of the outdated python Eggs."
	echo "Usage: pip_list_outdated <version>"
	echo ""
	echo "Example: pip_list_outdated 2"
	echo "         List all of the python2 outdated Eggs"
	return 1
    fi
    if [ "$1" = "2" ]; then
        pip2 list --outdated | awk 'NR > 2 {print $1}'
    elif [ "$1" = "3" ]; then
	pip3 list --outdated | awk 'NR > 2 {print $1}'
    else
	echo "A simple bash function to list all of the outdated python Eggs."
	echo "Usage: pip_list_outdated <version>"
	echo ""
	echo "Example: pip_list_outdated 2"
	echo "         List all of the python2 outdated Eggs"
	return 1
    fi
}

pip_update() {
    # If arguments list is empty, print usage menu an exit
    if [ "X$1" = "X" ]; then
	echo "A simple bash function to upgrade all of the python Eggs installed via pip."
	echo "Usage: pip_update <version>"
	echo ""
	echo "Example: pip_update 2"
	echo "         Updates all of the python2 Eggs"
	return 1
    fi
    if [ "$1" = "2" ]; then
        if [ -f ~/.pip_update2.blacklist ]; then
            LIST=$(comm -3 <(pip_list_outdated 2 | sort) <(cat ~/.pip_update2.blacklist | grep -v \# | sort))
        else
            LIST=$(pip_list_outdated 2)
        fi
        if [ "X$LIST" != "X"  ]; then
            echo $LIST
            pip2 install -U $LIST
        else
            BLACKLISTED_PACKAGES=`cat ~/.pip_update2.blacklist | grep \#`
            if [ "$BLACKLISTED_PACKAGES" != "0" ]; then
                echo "Some packages were not updated. Please have a look into ~/.pip_update2.blacklist"
            else
                echo "All packages are up-to-date!"
            fi
        fi
    elif [ "$1" = "3" ]; then
        if [ -f ~/.pip_update3.blacklist ]; then
            LIST=$(comm -3 <(pip_list_outdated 3 | sort) <(cat ~/.pip_update3.blacklist | grep -v \# | sort))
        else
            LIST=$(pip_list_outdated 3)
        fi
        if [ "X$LIST" != "X"  ]; then
            echo $LIST
            pip3 install -U $LIST
        else
            BLACKLISTED_PACKAGES=`cat ~/.pip_update3.blacklist | grep \#`
            if [ "$BLACKLISTED_PACKAGES" != "0" ]; then
                echo "Some packages were not updated. Please have a look into ~/.pip_update3.blacklist"
            else
                echo "All packages are up-to-date!"
            fi
        fi
    else
	echo "A simple bash function to upgrade all of the python Eggs installed via pip."
 	echo "Usage: pip_update <version>"
 	echo ""
 	echo "Example: pip_update 2"
 	echo "         Updates all of the python2 Eggs"
	return 1
    fi
}

# Password generator
pwdgen(){
    # First argument is the password lenght
    openssl rand -base64 $1
}

# Create a Maven project

mvn-create-project() {
    # If arguments list is empty, print usage menu an exit
    if [ "$#" -ne 2 ]; then
	echo "A simple bash function to create a Maven project."
	echo "Usage: mvn-create-project groupId artifactId"
	echo ""
	echo "Example:"
	echo "         mvn-create-project com.mycompany.my-app my-app"
	return 1
    fi
    # Call maven
    mvn archetype:generate -DgroupId=$1 -DartifactId=$2  \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DarchetypeVersion=1.4 -DinteractiveMode=false
}

###########
# ALIASES #
###########

# IOS XRv consoles
alias c1='minicom -D unix#/tmp/rtr01.pipe'
alias c2='minicom -D unix#/tmp/rtr02.pipe'
alias c3='minicom -D unix#/tmp/rtr03.pipe'
alias c4='minicom -D unix#/tmp/rtr04.pipe'
alias c5='minicom -D unix#/tmp/rtr05.pipe'
alias c6='minicom -D unix#/tmp/rtr06.pipe'
alias c7='minicom -D unix#/tmp/rtr07.pipe'
alias c8='minicom -D unix#/tmp/rtr08.pipe'

# Legacy SSH with DH Group1 + old CBC ciphers
alias sshl='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -oCiphers=+aes128-cbc,aes192-cbc,aes256-cbc'

# tmux aliases
alias ts='tmux' # tmux start
alias ta='tmux attach -t' # tmux attach
alias tl='tmux ls' # tmux list

# various aliases
alias o='open'
alias man='man -P eless'
alias ec='/usr/local/bin/emacsclient --no-wait -c -a /usr/local/bin/emacs'
alias ll='ls -l'
alias la='ls -al'
alias grep='grep --colour=auto'
alias sshx='ssh -X'
alias enaHidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias disaHidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'
alias oc='octave-cli'
alias bupgrade='brew upgrade && brew cask upgrade'
alias bhupgrade='brew upgrade --fetch-HEAD && brew cask upgrade'
alias bclean='brew cleanup -s'
alias unquarantine='xattr -r -d com.apple.quarantine'
alias umlet='/Applications/Umlet/umlet.sh'
alias magit="emacs --no-window-system --no-init-file \
      --load ~/.dotfiles/magit/magit-init.el \
      --eval '(progn (magit-status) (delete-other-windows))'"
alias git-update-submodules='git submodule foreach --recursive git checkout master && \
      git submodule foreach --recursive git pull'

###################
# Bash Completion #
###################
# Use existing homebrew v1 completions #
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
# Turn on homebre v2 bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

###################################
# Showing a fortune in each *term #
###################################
case $TERM in
    xterm*|rxvt|Eterm|eterm)
	cowthink `fortune`
	;;
esac

###################################
# Load iTerm2 "Shell Integration" #
###################################
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#######################
# Add personal config #
#######################
if [ -f ~/.bash_personal ]; then
    . ~/.bash_personal
fi

# added by travis gem
[ -f /Users/taareda4/.travis/travis.sh ] && source /Users/taareda4/.travis/travis.sh
