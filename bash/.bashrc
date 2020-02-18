git='%{$fg_bold[blue]%}$(git_prompt_info)%'
user_host="%n%D{@}%m"
date_time="${fg[red]%}%W-%T%"
dir="%{$fg[cyan]%}%d% "
end="%{$reset_color%} $%  "

ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%"

#PS1='${ret_status} ${user_host} ${dir} ${date_time}.
#        ${ret_status} %{$fg_bold[blue]%}$(git_prompt_info)% ${end}'


MACHINE='\u@\h'
DIR='\[\e[36m\]$PWD'
DATETIME='\[\e[31m\]\d-\A'
PROMPT='\n\e[0m\]$'

#PS1='${MACHINE} ${DIR} ${DATETIME} ${PROMPT} '
PS1='\[\e[1;0m\]\u@\h \[\e[1;36m\]$PWD \[\e[1;31m\]\D{%Y/%m/%d}-\A \n\e[1;0m\]\$ '

# Export Paths
    # Zsh Configs
        export ZSH=~/.oh-my-zsh

# Programs General
#   General
        alias cl='clear'

# Programs Machine Specific
#   Personal
#   Personal-Server
        if [ "$HOST" == 'server-centos' ]; then
            alias web-edit="/etc/httpd/conf/httpd.conf"
            alias web-start="service httpd start"
            alias plex-start="sudo systemctl start plexmediaserver.service"
            alias plex-stop="sudo systemctl stop plexmediaserver.service"
            alias plex-disable-firewall="sudo systemctl stop firewalld.service"
        fi

