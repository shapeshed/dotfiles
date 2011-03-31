#!/bin/bash
tmux start-server
tmux new-session -d -s shapeshed -n bash
tmux new-window -t shapeshed:1 -n mutt
tmux new-window -t shapeshed:2 -n irssi
tmux new-window -t shapeshed:3 -n ttyytter
tmux new-window -t shapeshed:4 -n apu
tmux new-window -t shapeshed:5 -n shed

tmux send-keys -t shapeshed:1 'mutt' C-m
tmux send-keys -t shapeshed:2 'irssi' C-m
tmux send-keys -t shapeshed:3 'ttytter' C-m
tmux send-keys -t shapeshed:4 'ssh apu.pebbleit.com' C-m
tmux send-keys -t shapeshed:5 'ssh shapeshed.com' C-m

tmux select-window -t shapeshed:0
tmux attach-session -d -t shapeshed




