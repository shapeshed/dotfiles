#!/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'taxiapp'); then
cd ~/Sites/londontaxiapp.com

tmux new-session -d -s 'taxiapp' -n 'zsh'
tmux set default-path ~/Sites/londontaxiapp.com
tmux set-option base-index 1


tmux new-window -t 'taxiapp':2 -n 'vim'

tmux new-window -t 'taxiapp':3 -n 'git'

tmux new-window -t 'taxiapp':4 -n 'console'

tmux new-window -t 'taxiapp':5 -n 'logs'

tmux new-window -t 'taxiapp':6 -n 'capistrano'

tmux new-window -t 'taxiapp':7 -n 'server'


# set up tabs and panes

# tab "zsh"


# tab "vim"

tmux send-keys -t 'taxiapp':2 'vim .' C-m


# tab "git"

tmux send-keys -t 'taxiapp':3 'git pull' C-m


# tab "console"

tmux send-keys -t 'taxiapp':4 'r c' C-m


# tab "logs"

tmux send-keys -t 'taxiapp':5 'tail -f log/development.log' C-m


# tab "capistrano"


# tab "server"

tmux send-keys -t 'taxiapp':7 'ssh addapps-001.vm.brightbox.net' C-m



tmux select-window -t 'taxiapp':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'taxiapp'
else
    tmux -u switch-client -t 'taxiapp'
fi
