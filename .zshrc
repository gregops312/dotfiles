#   Colors
    autoload -U colors && colors

autoload -U promptinit
promptinit

#PS1="Done$ "
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
        alias gits='git status'
        alias gitb='git branch'
        alias gitba='git branch -a'
        alias gitca'git commit -a'
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
            alias mvn--server-ignore="mvn clean install $ignore_yes $dev_un"
            alias mvn-server="mvn clean install $ignore_no $dev_un"
            alias mvn-integration="mvn clean install $ignore_no $int"
#       NiFi
            alias nifi-start="bash /Applications/nifi-0.3.0/nifi-assembly/target/nifi-0.3.0-bin/nifi-0.3.0/bin/nifi.sh start"
            alias nifi-stop="bash /Applications/nifi-0.3.0/nifi-assembly/target/nifi-0.3.0-bin/nifi-0.3.0/bin/nifi.sh stop"
#   Maven
        alias mvn-clean-install="mvn clean install"
        alias mvn-ci-skipTest='mvn clean install -DskipTests=true'
#   Boot 2 Docker
#        alias shellinit="$(boot2docker shellinit)"
        alias docks="boot2docker start"
        alias dockup-dm="docker-compose -f docker-compose-dm.yml up"
        alias dockup="docker-compose up"
        alias certs="boot2docker ssh"
#   Docker - Machine
        alias dock-start="docker-machine start default"
        alias dock-stop="docker-machine stop default"
        alias dock-env="docker-machine env default"
        alias dock-ip="docker-machine ip default"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="greg-kman"


source "$ZSH/oh-my-zsh.sh"
