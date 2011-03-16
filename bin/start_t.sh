#!/bin/bash
tmux start-server
tmux new-session -d -s shapeshed -n bash

tmux new-session -d -s shapeshed -n bash 
tmux new-window -t shapeshed:1 -n apu
tmux new-window -t shapeshed:2 -n shed 
tmux split-window -t shapeshed:0 -h -p 30
tmux split-window -t shapeshed:0 -v
tmux split-window -t shapeshed:0 -v

tmux send-keys -t shapeshed:0.1 'mutt' C-m 
tmux send-keys -t shapeshed:0.2 'irssi' C-m
tmux clock-mode -t shapeshed:0.3
tmux send-keys -t shapeshed:1 'ssh apu.pebbleit.com' C-m 
tmux send-keys -t shapeshed:2 'ssh shapeshed.com' C-m 

tmux resize-pane -R -t shapeshed:0.0 20

tmux select-window -t shapeshed:0
tmux select-pane -t shapeshed:0.0
tmux attach-session -d -t shapeshed


