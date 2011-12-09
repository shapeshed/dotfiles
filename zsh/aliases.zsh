# ------------------------
# Ruby
# ------------------------

# change into the directory of a gem
function cdgem {
  cd `gem env gemdir`/gems
  cd `ls | grep $1 | sort | tail -1`
}

# open documentation for a gem
function gemdoc {
  GEMDIR=`gem env gemdir`/doc
  open $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`/rdoc/index.html
}

alias r='rails'
alias b="bundle"
alias be="bundle exec"
alias gi="gem install"
alias giv="gem install -v"

# ------------------------
# Vim
# ------------------------
alias v="vim"

# ------------------------
# Tmux
# ------------------------

# Start a tmux session with my layout
alias st='start_tmux.sh'

# ------------------------
# Unix
# ------------------------

# Saves repeating ps aux | grep foo
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

# Always edit crontab with Vim
alias crontab="VIM_CRONTAB=true crontab"


# ------------------------
# Git 
# ------------------------
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gl='git pull'
alias gp='git push'
alias gc='git commit'
