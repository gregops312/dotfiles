source ~/.zshrc-custom

export ZSH=~/.oh-my-zsh
export GOPATH=~/code/gocode
export PATH=$PATH:~/code/gocode/bin
autoload -U colors && colors
autoload -U promptinit
promptinit

alias ussh='ssh -oStrictHostKeyChecking=no'

alias cl='clear'

# Docker
dockerc='which docker-compose'
if [ "$dockerc" != 'docker-compose not found' ]; then
        alias dc='docker-compose'
fi

# if [ "$HOST" == 'server-centos' ]; then
    alias web-edit="/etc/httpd/conf/httpd.conf"
    alias web-start="service httpd start"
    alias plex-start="sudo systemctl start plexmediaserver.service"
    alias plex-stop="sudo systemctl stop plexmediaserver.service"
    alias plex-disable-firewall="sudo systemctl stop firewalld.service"
# fi

# Set theme in ~/.oh-my-zsh/themes/
ZSH_THEME="greg-kman"

plugins=(bash bundler completion docker git gradle kitchen knife kubectl mvn node python rake ruby sudo zsh)
source "$ZSH/oh-my-zsh.sh"
