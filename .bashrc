#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='\[\e[1;37m\][\u@\h\[\e[1;36m\] \w]\$ \[\033[0m\]'

# Dircolors
#eval `dircolors ~/colors/dircolors-solarized-master/dircolors.ansi-dark`

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups

# Expand the history size
HISTFILESIZE=50000 
HISTSIZE=500

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
export PATH="$PATH:~/scripts"

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

source ~/.phpbrew/bashrc

export GIT_PROMPT_FETCH_REMOTE_STATUS=0
export QT_GRAPHICSSYSTEM=native

if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
  . ~/.bash-git-prompt/gitprompt.sh
fi

if [ -f /usr/share/autojump/autojump.bash ]; then
  . /usr/share/autojump/autojump.bash
fi

# Start gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"
