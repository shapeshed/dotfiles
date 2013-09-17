# ensure camper_van is running locally (systemd)
# connect to networks
# start notification daemon
connect.sh > /dev/null
notifiii.sh  > /dev/null &
tmux new-session -s IRC 
