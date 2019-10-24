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
        alias cl='clear'
#   SSH
        alias gk='ssh server@gregorykman.tk'
        alias school='ssh gkman@fourier.cs.iit.edu'

