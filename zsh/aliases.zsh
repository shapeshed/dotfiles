# Vim
alias v="vim"

# Saves repeating ps aux | grep foo
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

# Always edit crontab with Vim
alias crontab="VIM_CRONTAB=true crontab"

# Git 
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gl='git pull'
alias gp='git push'
alias gc='git commit'
alias gd='git diff'
alias git commit='git commit -S'

# Radio 
alias playr4="mplayer -playlist 'http://bbc.co.uk/radio/listen/live/r4.asx'"

# Node.js
alias grunt='grunt --stack'

# Platform specific aliases
if [[ `uname` == 'Linux' ]]; then
  alias ls='ls --color'
  alias less='less -R'
elif [[ `uname` == 'Darwin' ]]; then
  alias update='brew update && brew upgrade && getchromium'
fi

alias pj='python -m json.tool | less'
