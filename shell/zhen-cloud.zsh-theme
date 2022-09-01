if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='☁️'
fi

currenttime=$(date +%H)
if [[ $currenttime -gt 18 || $currenttime -lt 6 ]]; then
    ZSH_THEME_CLOCK='🌙 '
else
    ZSH_THEME_CLOCK='☀️  '
fi



PROMPT='%{$fg_bold[cyan]%}$ZSH_THEME_CLOUD_PREFIX  %{$fg[white]%}%n%{$fg_bold[green]%}%p %{$fg[green]%}%~ %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}'

RPROMPT='%{$fg_bold[cyan]%}$ZSH_THEME_CLOCK %{$fg[white]%}%T  %{$fg[yellow]%}$(pyenv_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
