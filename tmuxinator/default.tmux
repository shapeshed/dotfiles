#!/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'default'); then
cd ~/

tmux new-session -d -s 'default' -n 'zsh'
tmux set default-path ~/
tmux set-option base-index 1


tmux new-window -t 'default':2 -n 'mutt'

tmux new-window -t 'default':3 -n 'irssi'

tmux new-window -t 'default':4 -n 'ttytter'

tmux new-window -t 'default':5 -n 'apu'


# set up tabs and panes

# tab "zsh"


# tab "mutt"

tmux send-keys -t 'default':2 'mutt' C-m


# tab "irssi"

tmux send-keys -t 'default':3 'irssi' C-m


# tab "ttytter"

tmux send-keys -t 'default':4 'ttytter' C-m


# tab "apu"

tmux send-keys -t 'default':5 'ssh apu.pebbleit.com' C-m



tmux select-window -t 'default':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'default'
else
    tmux -u switch-client -t 'default'
fi
