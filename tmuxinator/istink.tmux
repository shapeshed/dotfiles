#!/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'istink'); then
cd ~/Sites/istink

tmux new-session -d -s 'istink' -n 'vim'
tmux set default-path ~/Sites/istink
tmux set-option base-index 1


tmux new-window -t 'istink':2 -n 'git'

tmux new-window -t 'istink':3 -n 'console'

tmux new-window -t 'istink':4 -n 'logs'

tmux new-window -t 'istink':5 -n 'capistrano'

tmux new-window -t 'istink':6 -n 'server'


# set up tabs and panes

# tab "vim"

tmux send-keys -t 'istink':1 'vim .' C-m


# tab "git"

tmux send-keys -t 'istink':2 'git pull' C-m


# tab "console"

tmux send-keys -t 'istink':3 'script/console' C-m


# tab "logs"

tmux send-keys -t 'istink':4 'tail -f log/development.log' C-m


# tab "capistrano"


# tab "server"

tmux send-keys -t 'istink':6 'ssh apu.pebbleit.com' C-m



tmux select-window -t 'istink':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'istink'
else
    tmux -u switch-client -t 'istink'
fi
