# Add bin folder to path
[ -d ~/bin ] && export PATH=~/bin:$PATH

# Alias definitions.
# TODO - create zsh specific file
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

# Load other zsh config
for zsh_file ($HOME/.zsh/*.zsh) source $zsh_file

