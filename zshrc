
# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Enable vi keybindings
bindkey -v

# Add bin folder to path
[ -d ~/bin ] && export PATH=~/bin:$PATH

# Alias definitions.
# TODO - create zsh specific file
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Colors
export CLICOLOR=1;

# Customize prompt
PROMPT=$'[%n@%m %~]$ '

# Enable completion
autoload -Uz compinit
compinit


