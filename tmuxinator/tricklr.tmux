#!/bin/zsh
tmux start-server

if ! $(tmux has-session -t 'taxiapp'); then
cd ~/Sites/tricklrapp.com
rvm use 1.9.2@tricklr
env TMUX= tmux start-server \; set-option -g base-index 1 \; new-session -d -s 'taxiapp' -n 'zsh'
tmux set-option -t 'taxiapp' default-path ~/Sites/tricklrapp.com


tmux new-window -t 'taxiapp':2 -n 'vim'

tmux new-window -t 'taxiapp':3 -n 'foreman'

tmux new-window -t 'taxiapp':4 -n 'guard'

tmux new-window -t 'taxiapp':5 -n 'git'

tmux new-window -t 'taxiapp':6 -n 'console'

tmux new-window -t 'taxiapp':7 -n 'unicorn'

tmux new-window -t 'taxiapp':8 -n 'logs'

tmux new-window -t 'taxiapp':9 -n 'postgres'


# set up tabs and panes

# tab "zsh"

tmux send-keys -t 'taxiapp':1 'rvm use 1.9.2@tricklr' C-m


# tab "vim"

tmux send-keys -t 'taxiapp':2 'rvm use 1.9.2@tricklr && vim .' C-m


# tab "foreman"

tmux send-keys -t 'taxiapp':3 'rvm use 1.9.2@tricklr && bundle exec foreman start' C-m


# tab "guard"

tmux send-keys -t 'taxiapp':4 'rvm use 1.9.2@tricklr && bundle exec guard' C-m


# tab "git"

tmux send-keys -t 'taxiapp':5 'rvm use 1.9.2@tricklr && git pull' C-m


# tab "console"

tmux send-keys -t 'taxiapp':6 'rvm use 1.9.2@tricklr && bundle exec rails console' C-m


# tab "unicorn"

tmux send-keys -t 'taxiapp':7 'rvm use 1.9.2@tricklr && bundle exec unicorn -c config/unicorn.rb -D' C-m


# tab "logs"

tmux send-keys -t 'taxiapp':8 'rvm use 1.9.2@tricklr && tail -f log/development.log' C-m


# tab "postgres"

tmux send-keys -t 'taxiapp':9 'rvm use 1.9.2@tricklr && psql -d tricklr_development' C-m



tmux select-window -t 'taxiapp':1

fi

if [ -z $TMUX ]; then
    tmux -u attach-session -t 'taxiapp'
else
    tmux -u switch-client -t 'taxiapp'
fi