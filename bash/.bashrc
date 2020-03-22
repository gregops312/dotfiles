git='%{$fg_bold[blue]%}$(git_prompt_info)%'
user_host="%n%D{@}%m"
date_time="${fg[red]%}%W-%T%"
dir="%{$fg[cyan]%}%d% "
end="%{$reset_color%} $%  "

ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%"

MACHINE='\u@\h'
DIR='\[\e[36m\]$PWD'
DATETIME='\[\e[31m\]\d-\A'
PROMPT='\n\e[0m\]$'

#PS1='${MACHINE} ${DIR} ${DATETIME} ${PROMPT} '
PS1='\[\e[1;0m\]\u@\h \[\e[1;36m\]$PWD \[\e[1;31m\]\D{%Y/%m/%d}-\A \n\e[1;0m\]\$ '

export ZSH=~/.oh-my-zsh

alias cl='clear'
