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

# Some useful aliases
alias ll='ls -l'
alias la='ls -al'
alias grep='grep --colour=auto'
#alias ssh='ssh -X'
alias enaHidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias disaHidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Showing a fortune in each *term
 case $TERM in
     xterm*|rxvt|Eterm|eterm)
	 cowthink `fortune`
    ;;
esac

# Timestamps in Bash History
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# Setting locale: en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

#
# A simple bash function to upgrade Python 2/3 packages
#

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
   pip2 list --outdated --format=legacy | awk '{print $1}'
  elif [ "$1" = "3" ]; then
	 pip3 list --outdated --format=legacy | awk '{print $1}'
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
	 LIST=$(pip_list_outdated 2)
	 echo $LIST
         pip2 install -U $LIST
 elif [ "$1" = "3" ]; then
	 LIST=$(pip_list_outdated 3)
	 echo $LIST
         pip3 install -U $LIST
 else
	echo "A simple bash function to upgrade all of the python Eggs installed via pip."
 	echo "Usage: pip_update <version>"
 	echo ""
 	echo "Example: pip_update 2"
 	echo "         Updates all of the python2 Eggs"
	return 1
 fi
}

pwdgen(){
    # First argument is the password lenght
    openssl rand -base64 $1
}

#
#
#

# Homebrew's formulae that put executables in /usr/local/sbin
export PATH="/usr/local/sbin:$PATH"

# Add GEM bin PATH
export PATH="~/.gem/ruby/2.0.0/bin:$PATH"

# Lefacy SSH with DH Group1
alias sshl='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1'

# Set EDITOR
export EDITOR="emacs"

################
# tmux aliases #
################
# tmux start
alias ts='tmux'
# tmux attach
alias ta='tmux attach -t'
# tmux list
alias tl='tmux ls'
