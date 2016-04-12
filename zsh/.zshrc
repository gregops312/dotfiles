export ZSH=~/.oh-my-zsh
autoload -U colors && colors
autoload -U promptinit
promptinit

# Programs General
#   General
        alias cl='clear'
#   Git
        git='which git'
        if [ "$git" != 'git not found' ]; then
            alias gits='git status'
            alias gitb='git branch'
            alias gitba='git branch -a'
            alias gitca'git commit -a'
            alias gitl='git log'
            alias gita='git rebase --abort'
            alias gitf='git fetch -a'
            alias gitfp='git fetch -p'
        fi
#   Maven
        alias mvn-clean-install="mvn clean install"
        alias mvn-ci-skipTest='mvn clean install -DskipTests=true'
#   SSH
        ssh='which ssh'
        if [ "$ssh" != 'ssh not found' ]; then
            alias gk='ssh gkman@gregorykman.tk'
            alias adam='ssh greg.kman@dev-adamantium.uptake.com'
            alias emd='ssh gregory.kman@staging-emd-nifi.uptake.com'
        fi
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
#   Work
#       Variables
            local_es="-DenvTarget=local -Delasticsearch.host=192.168.99.103"
            ignore_yes="-Dsurefire.ignore.failures=true"
            ignore_no="-Dsurefire.ignore.failures=false"
#       Elastic Search
            alias es="bash /Applications/elasticsearch-1.7.1/bin/elasticsearch"
#       Docker-Machine
            alias uptake-core-start="docker-machine start uptakedev"
            alias uptake-core-stop="docker-machine stop uptakedev"
            alias uptake-core-env="docker-machine env uptakedev"
            alias uptake-core-ip="docker-machine ip uptakedev"
            alias uptake-core-ssh="docker-machine ssh uptakedev"
#       Maven
            alias mvn-local-ignore="mvn clean install $ignore_yes $local_es"
            alias mvn-local="mvn clean install $ignore_no $local_es"
            alias mvn-server-ignore="mvn clean install $ignore_yes $dev_un"
            alias mvn-server="mvn clean install $ignore_no $dev_un"
#       NiFi
            alias nifi-start="bash /Applications/nifi-0.*.0/bin/nifi.sh start"
            alias nifi-stop="bash /Applications/nifi-0.*.0/bin/nifi.sh stop"

# Set theme in ~/.oh-my-zsh/themes/
ZSH_THEME="greg-kman"
source "$ZSH/oh-my-zsh.sh"
