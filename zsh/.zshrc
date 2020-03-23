source ~/.zshrc-custom

export ZSH=~/.oh-my-zsh
export GOPATH=~/code/gocode
export PATH=$PATH:~/bin:~/code/gocode/bin
autoload -U colors && colors
autoload -U promptinit
promptinit

alias cl='clear'

# Set theme in ~/.oh-my-zsh/themes/
ZSH_THEME="greg-kman"

# Setups up notifications with the use of bgnotify plugin
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bgnotify
bgnotify_threshold=7  # Notification threshold in seconds
function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
  [ $1 -eq 0 ] && title="Holy Smokes Batman!" || title="Holy Graf Zeppelin!"
  bgnotify "$title -- after $3 s" "$2";
}

plugins=(alias-finder ansible autojump aws battery bgnotify brew bundler colored-man-pages colorize docker docker-compose encode64 extract git git-auto-fetch git-prompt gitignore golang gradle kitchen knife kubectl mvn node npm osx python rake ruby rvm sudo terraform tmux ubuntu vagrant vault vscode)

source "$ZSH/oh-my-zsh.sh"
