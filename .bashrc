#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Path
#=========================================
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$PATH:~/.gem/ruby/2.1.0/bin"
export PATH="$PATH:/vendor/bin"

# aliases
#=========================================
alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias df="df -Tha --total"
alias mkdir="mkdir -pv"
alias cerbero='~/cerbero/cerbero-uninstalled'
alias art='php artisan'
alias update='sudo pacman -Syyu'
alias vm='vagrant up'
alias rvm='vagrant reload --provision'
alias nginxstart='sudo systemctl start nginx'
alias nginxreload='sudo systemctl restart nginx'
alias phpreload='sudo systemctl restart php-fpm'
alias db='mysql -uariel -p'


# Functions
#=========================================
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

# Restart a service
function srvrestart {
	if [ -z "$1" ]; then
    	# display usage if no parameters given
    	echo "Usage: srvrestart <service_name>"
 	else
 		echo "Restarting $1..."
 		sudo systemctl restart $1
 	fi
}

# Show a service status
function srvstat {
	if [ -z "$1" ]; then
    	# display usage if no parameters given
    	echo "Usage: srvstat <service_name>"
 	else
 		sudo systemctl -l status $1
 	fi
}
