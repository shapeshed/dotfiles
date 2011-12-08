#!/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'istink'); then
cd ~/Sites/istink.stink.tv

env TMUX= tmux start-server \; set-option -g base-index 1 \; new-session -d -s 'istink' -n 'zsh'
tmux set-option -t 'istink' default-path ~/Sites/istink.stink.tv


tmux new-window -t 'istink':2 -n 'vim'

tmux new-window -t 'istink':3 -n 'foreman'

tmux new-window -t 'istink':4 -n 'guard'

tmux new-window -t 'istink':5 -n 'git'

tmux new-window -t 'istink':6 -n 'thin'

tmux new-window -t 'istink':7 -n 'console'

tmux new-window -t 'istink':8 -n 'logs'

tmux new-window -t 'istink':9 -n 'capistrano'


# set up tabs and panes

# tab "zsh"

tmux send-keys -t 'istink':1 '' C-m


# tab "vim"

tmux send-keys -t 'istink':2 'vim .' C-m


# tab "foreman"

tmux send-keys -t 'istink':3 'bundle exec foreman start' C-m


# tab "guard"

tmux send-keys -t 'istink':4 'bundle exec guard' C-m


# tab "git"

tmux send-keys -t 'istink':5 'git pull' C-m


# tab "thin"

tmux send-keys -t 'istink':6 'bundle exec thin -C config/thin/development.yml start' C-m


# tab "console"

tmux send-keys -t 'istink':7 'bundle exec rails c' C-m


# tab "logs"

tmux send-keys -t 'istink':8 'tail -f log/development.log' C-m


# tab "capistrano"

tmux send-keys -t 'istink':9 '' C-m



tmux select-window -t 'istink':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'istink'
else
    tmux -u switch-client -t 'istink'
fi