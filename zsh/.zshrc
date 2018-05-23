source ~/.zshrc-custom

export ZSH=~/.oh-my-zsh
export GOPATH=~/code/gocode
export PATH=$PATH:~/code/gocode/bin
autoload -U colors && colors
autoload -U promptinit
promptinit

alias ussh='ssh -oStrictHostKeyChecking=no'

# Programs General
#   General
        alias cl='clear'
#   Git
        git='which git'
        if [ "$git" != 'git not found' ]; then
            alias gits='git status'
            alias gitl='git log'
            alias gita='git rebase --abort'
            alias gitf='git fetch -a'
            alias gitfp='git fetch -p'
        fi
#   Docker
        dockerc='which docker-compose'
        if [ "$dockerc" != 'docker-compose not found' ]; then
            alias dc='docker-compose'
        fi
# Programs Machine Specific
#   Personal
#   Personal-Server
        # if [ "$HOST" == 'server-centos' ]; then
            alias web-edit="/etc/httpd/conf/httpd.conf"
            alias web-start="service httpd start"
            alias plex-start="sudo systemctl start plexmediaserver.service"
            alias plex-stop="sudo systemctl stop plexmediaserver.service"
            alias plex-disable-firewall="sudo systemctl stop firewalld.service"
        # fi

# Set theme in ~/.oh-my-zsh/themes/
ZSH_THEME="greg-kman"
plugins=(bundler chruby docker git gradle kitchen knife mvn python sudo kubectl completion zsh)
source "$ZSH/oh-my-zsh.sh"
