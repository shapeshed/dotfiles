#!/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'taxiapp'); then
cd ~/Sites/londontaxiapp.com

env TMUX= tmux start-server \; set-option -g base-index 1 \; new-session -d -s 'taxiapp' -n 'zsh'
tmux set-option -t 'taxiapp' default-path ~/Sites/londontaxiapp.com


tmux new-window -t 'taxiapp':2 -n 'vim'

tmux new-window -t 'taxiapp':3 -n 'foreman'

tmux new-window -t 'taxiapp':4 -n 'git'

tmux new-window -t 'taxiapp':5 -n 'console'

tmux new-window -t 'taxiapp':6 -n 'server'

tmux new-window -t 'taxiapp':7 -n 'logs'

tmux new-window -t 'taxiapp':8 -n 'capistrano'


# set up tabs and panes

# tab "zsh"

tmux send-keys -t 'taxiapp':1 '' C-m


# tab "vim"

tmux send-keys -t 'taxiapp':2 'vim .' C-m


# tab "foreman"

tmux send-keys -t 'taxiapp':3 'bundle exec foreman start' C-m


# tab "git"

tmux send-keys -t 'taxiapp':4 'git pull' C-m


# tab "console"

tmux send-keys -t 'taxiapp':5 'rails console' C-m


# tab "server"

tmux send-keys -t 'taxiapp':6 'rails server' C-m


# tab "logs"

tmux send-keys -t 'taxiapp':7 'tail -f log/development.log' C-m


# tab "capistrano"

tmux send-keys -t 'taxiapp':8 '' C-m



tmux select-window -t 'taxiapp':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'taxiapp'
else
    tmux -u switch-client -t 'taxiapp'
fi