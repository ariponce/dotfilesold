alias ls='ls --color=auto'
alias rm='rm -i'
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
alias prod='ssh nicolas@54.195.250.27'
alias pls='sudo $(history -p !!)'
alias httprst='sudo systemctl restart httpd'
alias codecept='vendor/bin/codecept'
alias df="df -Tha --total"
alias ..="cd .."
alias cd..="cd .."
alias satis-update="php /home/ariel/Sites/Plugins/bin/satis build /home/ariel/Sites/Plugins/satis.json /home/ariel/Sites/Plugins/mce"
alias shrug="echo '¯\_(ツ)_/¯'"
alias vhosts="sudo vim /etc/httpd/conf/extra/httpd-vhosts.conf"
alias futonprod="ssh -f -L localhost:15984:127.0.0.1:5984 nicolas@54.195.250.27 -N"
alias bye="exit"
