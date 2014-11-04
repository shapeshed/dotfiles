#!/bin/bash
bouncer=`pass show work/slack-bouncer` ~/bin/connect.sh > /dev/null
~/bin/notifiii.sh  > /dev/null &
tmux new-session -s IRC 
