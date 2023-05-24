export GIT_EDITOR='nvim'

typeset -ga precmd_functions
precmd_functions+='update_git_branch_prompt'
update_git_branch_prompt() {
    RPROMPT=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
}
