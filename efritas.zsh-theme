#   ___  _   _ __  ____   ___________  _   _
#  / _ \| | | |  \/  \ \ / /__  / ___|| | | |
# | | | | |_| | |\/| |\ V /  / /\___ \| |_| |
# | |_| |  _  | |  | | | |  / /_ ___) |  _  |
#  \___/|_| |_|_|  |_| |_| /____|____/|_| |_|

# Theme by @erikfritas - https://github.com/erikfritas


# Header, ex: "(🛡 username@hostname) [🗂 /current/dir]"
local username_preffix="%{$fg_bold[blue]%}🛡 %{$reset_color%}"

# if root, primary color is red
if [[ $UID -eq 0 ]]; then
    local u_color='red'
    local preffix='#'
else
    local u_color='green'
    local preffix='$'
fi

# using u_color and preffix
local dir='%{$fg_bold[blue]%}🗂  %{$terminfo[bold]%}%~%{$reset_color%}'
local username='${username_preffix}%{$terminfo[bold]$fg[${u_color}]%}%n@%m%{$reset_color%}'
local cmd_preffix='%{$fg_bold[${u_color}]%}${preffix}%{$reset_color%}'
# ===================

# Header Right, ex: "🌫 master", "🌫 ruby version 2.2.7"
# Header Right preffix
local hr_preffix='%{$fg_bold[red]%}🌫 %{$reset_color%}'

# Some contents of hr
local venv_prompt='$(virtualenv_prompt_info)'
local rvm_prompt='$(ruby_prompt_info)'
local git_prompt='$(git_prompt_info)'

# Status code, showed if an error occured
local status_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# =========================

# Some ZSH Constants
ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
# =========================

PROMPT="╭─(${username})─[${dir}] ${hr_preffix} ${venv_prompt}${rvm_prompt}${git_prompt} %B${status_code}%b
╰─%B${cmd_preffix}%b "
RPROMPT="|%* 🖥️|"

