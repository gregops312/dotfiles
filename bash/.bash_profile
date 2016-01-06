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
PS1='\u@\h \[\e[36m\]$PWD \[\e[31m\]\D{}-\A \n\e[0m\]$ '

# Variables

# Export Paths
    # Zsh Configs
        export ZSH=~/.oh-my-zsh
# Alias
#   Linux
        alias linux-version='lsb_release -a'
        alias cl='clear'
#   SSH
        alias gk='ssh server@gregorykman.tk'
        alias school='ssh gkman@fourier.cs.iit.edu'
#   Git
        alias gits="git status"
        alias gitb='git branch'
        alias gitba='git branch -a'
        alias gitca='git commit -a'
        alias gitl='git log'
        alias gita='git rebase --abort'
        alias gitf='git fetch -a'
        alias gitfp='git fetch -p'
#   Uptake Core
#       Variables
            b2d="-DenvTarget=local -Delasticsearch.host=192.168.59.103"
            dm="-DenvTarget=local -Delasticsearch.host=192.168.99.100"
            dev_un="-DenvTarget=dev -Delasticsearch.host=dev-unobtainium.uptake.com"
            int="-DenvTarget=intdev -Delasticsearch.host=integration.uptake.com"
            ignore_yes="-Dsurefire.ignore.failures=true"
            ignore_no="-Dsurefire.ignore.failures=false"
#       Commands
            alias mvn-dm-ignore="mvn clean install $ignore_yes $dm"
            alias mvn-dm="mvn clean install $ignore_no $dm"
            alias mvn-b2d-ignore="mvn clean install $ignore_yes $b2d"
            alias mvn-b2d="mvn clean install $ignore_no $b2d"
            alias mvn-server-ignore="mvn clean install $ignore_yes $dev_un"
            alias mvn-server="mvn clean install $ignore_no $dev_un"
            alias mvn-integration="mvn clean install $ignore_no $int"
#       NiFi
            alias nifi-start="bash /Applications/nifi-0.3.0/nifi-assembly/target/nifi-0.3.0-bin/nifi-0.3.0/bin/nifi.sh start"
            alias nifi-stop="bash /Applications/nifi-0.3.0/nifi-assembly/target/nifi-0.3.0-bin/nifi-0.3.0/bin/nifi.sh stop"
#       Elastic Search
            alias es="bash /Applications/elasticsearch-1.7.1/bin/elasticsearch"
#   Maven
        alias mvn-clean-install="mvn clean install"
        alias mvn-ci-skipTest='mvn clean install -DskipTests=true'
#   Docker
        alias dockup-dm="docker-compose -f docker-compose-dm.yml up"
        alias dockup="docker-compose up"
        alias dock-start="docker-machine start default"
        alias dock-stop="docker-machine stop default"
        alias dock-env="docker-machine env default"
        alias dock-ip="docker-machine ip default"

