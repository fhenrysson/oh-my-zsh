
function enabled_virtualenv() 
{
    if  [[ -n $VIRTUAL_ENV ]]; then
        echo "%{$fg[magenta]%}(%{$fg[green]%}`basename \"$VIRTUAL_ENV\"`%{$fg[magenta]%})%{$reset_color%}"
    fi
}

#PROMPT=$'%{$fg[green]%}%n%{$reset_color%}@%m %{$fg_bold[magenta]%}%2~%{$reset_color%} $(git_prompt_info) (%{$fg_bold[blue]%}%?%{$reset_color%})> '
PROMPT=$'[%*]:%{$fg_bold[magenta]%}%2~%{$reset_color%} (%{$fg_bold[blue]%}%?%{$reset_color%})> '
RPROMPT='$(git_prompt_info) $(git_prompt_status) $(enabled_virtualenv)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

