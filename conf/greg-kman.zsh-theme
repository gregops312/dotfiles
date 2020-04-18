# Need to fix git tracking stuff
# Need to fix git color stuff

# Battery
# $(battery_pct_prompt)

local git='%{$fg_bold[blue]%}$(git_prompt_info)%'
local user_host="%n%D{@}%m"
local date_time="${fg[red]%}%W-%T%"
local dir="%{$fg[cyan]%}%d% "
local end="%{$reset_color%} $%  "

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%"

PROMPT='${ret_status} ${user_host} ${dir} ${date_time} 
${ret_status} %{$fg_bold[blue]%}$(git_prompt_info)% ${end}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
