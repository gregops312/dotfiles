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

plugins=(alias-finder ansible autojump aws battery brew bundler colored-man-pages colorize docker docker-compose encode64 extract git git-auto-fetch git-prompt gitignore golang gradle kitchen knife kubectl mvn node npm osx python rake ruby rvm sudo terraform tmux ubuntu vagrant vault vscode)

source "$ZSH/oh-my-zsh.sh"
