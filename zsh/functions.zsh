# mkcd - make a directory and change to it
#
# This makes a directory with parents and changes into it
# mkdir /some/path/that/does/not/exist
# pwd
# /some/path/that/does/not/exist
#
function mkcd {
    mkdir -p "$*"
    cd "$*"
}

# fg - make zsh behave like bash
#
# By default zsh has the following behaviour
# fg %1
#
# This function makes fg behave like the bash builtin
# fg 1
#
fg() {
  if [[ $# -eq 1 && $1 = - ]]; then
    builtin fg %-
  else
    builtin fg %"$@"
  fi
}

# gr - search recursively with grep
function gr {
    grep -R "$*" .
}

# Saves repeating ps aux | grep foo
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

compdef _pass workpass
zstyle ':completion::complete:workpass::' prefix "$HOME/.work-password-store"
workpass() {
  PASSWORD_STORE_DIR=$HOME/.work-password-store/ pass $@
}



