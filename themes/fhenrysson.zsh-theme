
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function enabled_virtualenv() 
{
    if  [[ -n $VIRTUAL_ENV ]]; then
        echo "%{$fg[magenta]%}(%{$fg[green]%}`basename \"$VIRTUAL_ENV\"`%{$fg[magenta]%})%{$reset_color%}"
    fi
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

PROMPT=$'[%*]:%{$fg_bold[magenta]%}%2~%{$reset_color%} (%{$fg_bold[blue]%}%?%{$reset_color%})> '
RPROMPT='$(prompt_char) $(git_prompt_info) $(hg_prompt_info) $(git_prompt_status) $(enabled_virtualenv)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

