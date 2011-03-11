# Some useful aliases
# vi:filetype=sh:
alias aliases='vim ~/.bash_aliases && source ~/.bash_aliases'

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo "alias $name='$value'" >> ~/.bash_aliases
   eval "alias $name='$value'"
   alias $name
}

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

# mojombo http://gist.github.com/180587
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

alias todo='vim /Users/george/Documents/TODO/TODO.md'
alias crontab="VIM_CRONTAB=true crontab"
alias r='rails'
alias ss='start_screens.sh'
