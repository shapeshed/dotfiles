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

# npm completion
. <(npm completion)

# Load other zsh config
for zsh_file ($HOME/.zsh/*.zsh) source $zsh_file

if [ "$PS1" != "" -a "${STARTED_TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
    STARTED_TMUX=1; export STARTED_TMUX
    sleep 1
    ( (tmux has-session -t `hostname -s` && tmux attach-session -t `hostname-s`) || (tmux new-session -s `hostname -s`) ) && exit 0
    echo "tmux failed to start"
fi

