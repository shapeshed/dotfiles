# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Add bin folder to path
[ -d ~/bin ] && export PATH=~/bin:$PATH

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

export CLICOLOR=1
export GREP_OPTIONS="--color"
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1='\[\e[1;34m\][\u@\h \W]\$\[\e[0m\] '
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

