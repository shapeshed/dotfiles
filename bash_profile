[ -f ~/.bashrc ] && source ~/.bashrc

[ -d ~/bin ] && export PATH=~/bin:$PATH
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1='\[\e[1;34m\][\u@\h \W]\$\[\e[0m\] '
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
