# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

# Battery
# $(battery_pct_prompt)

ZSH_THEME_AWS_PREFIX="(aws:"
ZSH_THEME_AWS_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# %{fg[blue]%}
local aws="%{$fg[yellow]%}$(aws_prompt_info)% "
local date_time="${fg[red]%}%W-%T%"
local dir="%{$fg[cyan]%}%~% "
local end="%{$reset_color%} $%  "
local git="%{$fg_bold[blue]%} [$(git_prompt_info)%{$fg_bold[blue]%}] %"
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%"
local user_host="%n%D{@}%m"

PROMPT='${ret_status} ${user_host} ${dir} ${aws} ${git} ${end}'
RPROMPT=''
