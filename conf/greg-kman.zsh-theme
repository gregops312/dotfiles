# Battery
# $(battery_pct_prompt)

ZSH_THEME_AWS_PREFIX="(aws:"
ZSH_THEME_AWS_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

local git='%{$fg_bold[blue]%}$(git_prompt_info)%'
local user_host="%n%D{@}%m"
local date_time="${fg[red]%}%W-%T%"
local dir="%{$fg[cyan]%}%d% "
local end="%{$reset_color%} $%  "
local newline=$'\n'

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%"

PROMPT='${ret_status} ${user_host} ${dir}
${ret_status} %{$fg_bold[blue]%}$(git_prompt_info)%  $(aws_prompt_info)$'\n'${end}'

RPROMPT=''
