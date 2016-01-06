#   Check and save OS type
osnn='unknown'
osn="$(uname)"

if [ $osn = 'Windows' ]; then
    osnn='windows'
elif [ $osn = 'Darwin' ]; then
    osnn='mac'
elif [ $osn = 'Linux' ]; then
    osnn='linux'
fi

#   Load OS generic Features
        export ZSH=~/.oh-my-zsh
        autoload -U colors && colors
        autoload -U promptinit
        promptinit
#   Load OS Specific Features
#       Windows
if [ "$osnn" = 'windows' ]; then
    doskey ls=dir
    doskey cl=cls
#    echo 'windows loads'
#       Mac
elif [ "$osnn" = 'mac' ]; then
#    echo 'mac loads'
#       Linux
elif [ "$osnn" = 'linux' ]; then
#    echo 'linux loads'
fi

#   Load Base OS dependent commands
if [ "$osnn" = 'windows' ]; then
    echo 'windows'
elif [[ ( "$osnn" = 'mac' ) || ( "$osnn" = 'linux' ) ]]; then
    #   Variables
    #       Personal
    #       Work
        b2d="-DenvTarget=local -Delasticsearch.host=192.168.59.103"
        dm="-DenvTarget=local -Delasticsearch.host=192.168.99.100"
        dev_un="-DenvTarget=dev -Delasticsearch.host=dev-unobtainium.uptake.com"
        int="-DenvTarget=intdev -Delasticsearch.host=integration.uptake.com"
        ignore_yes="-Dsurefire.ignore.failures=true"
        ignore_no="-Dsurefire.ignore.failures=false"

    #   SSH
            alias gk='ssh gkman@gregorykman.tk'
    #   Git
            alias gits='git status'
            alias gitb='git branch'
            alias gitba='git branch -a'
            alias gitca'git commit -a'
            alias gitl='git log'
            alias gita='git rebase --abort'
            alias gitf='git fetch -a'
            alias gitfp='git fetch -p'
    #   Maven
    #           General
            alias mvn-clean-install="mvn clean install"
            alias mvn-ci-skipTest='mvn clean install -DskipTests=true'
    #           Work
            alias mvn-dm-ignore="mvn clean install $ignore_yes $dm"
            alias mvn-dm="mvn clean install $ignore_no $dm"
            alias mvn-b2d-ignore="mvn clean install $ignore_yes $b2d"
            alias mvn-b2d="mvn clean install $ignore_no $b2d"
            alias mvn-server-ignore="mvn clean install $ignore_yes $dev_un"
            alias mvn-server="mvn clean install $ignore_no $dev_un"
            alias mvn-integration="mvn clean install $ignore_no $int"
    #   Elastic Search
            alias es="bash /Applications/elasticsearch-1.7.1/bin/elasticsearch"
    #   Docker-Machine
            alias dock-start="docker-machine start default"
            alias dock-stop="docker-machine stop default"
            alias dock-env="docker-machine env default"
            alias dock-ip="docker-machine ip default"
    #   NiFi
            alias nifi-start="bash /Applications/nifi-0.*.0/bin/nifi.sh start"
            alias nifi-stop="bash /Applications/nifi-0.*.0/bin/nifi.sh stop"
    #   Misc
            alias linux-version='lsb_release -a'
            alias cl='clear'
            alias web-edit="/etc/httpd/conf/httpd.conf"
            alias web-start="service httpd start"
            alias plex-start="sudo systemctl start plexmediaserver.service"
            alias plex-stop="sudo systemctl stop plexmediaserver.service"
            alias plex-disable-firewall="sudo systemctl stop firewalld.service"
    echo 'mac/linux'
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="greg-kman"
source "$ZSH/oh-my-zsh.sh"
