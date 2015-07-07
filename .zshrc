autoload -U colors && colors

autoload -U promptinit
promptinit

PS1="Done$ "

# Path to your oh-my-zsh installation.
export ZSH=/Users/gkman/.oh-my-zsh

# Alias

# 	Git
		alias gits='git status'
		alias gitb='git branch -a'
		alias gitca'git commit -a'
		alias gitl='git log'
		alias gita='git rebase --abort'
		alias gitf='git fetch -a'
		alias gitfp='git fetch -p'
#	Uptake Core
alias dockerup="boot2docker start && $(boot2docker shellinit)  &&  docker-compose up --allow-insecure-ssl"



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="greg-kman"


source "$ZSH/oh-my-zsh.sh"
