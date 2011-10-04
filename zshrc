# Add bin folder to path
[ -d ~/bin ] && export PATH=~/bin:$PATH

# Alias definitions.
# TODO - create zsh specific file
[ -f ~/.bash_aliases ] && source ~/.bash_aliases


# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load other zsh config
for zsh_file ($HOME/.zsh/*.zsh) source $zsh_file

