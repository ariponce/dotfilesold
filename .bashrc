#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='[\u@\h \W]\$ '


# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups

# Expand the history size
HISTFILESIZE=10000 
HISTSIZE=100

# commands with leading space do not get added to history
HISTCONTROL=ignorespace

# Path
#=========================================
export TERM=xterm-256color
export EDITOR=vim
export GOPATH=~/go
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$PATH:~/.gem/ruby/2.1.0/bin"
export PATH="$PATH:/vendor/bin"
export PATH="$PATH:/usr/local/go/bin"

# aliases
#=========================================
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Functions
#=========================================
if [ -f ~/.bash_functions ]; then
. ~/.bash_functions
fi