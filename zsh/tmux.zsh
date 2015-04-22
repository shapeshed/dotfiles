if command -v tmux > /dev/null; then
  [[ -z $TMUX ]] && exec tmux
fi
