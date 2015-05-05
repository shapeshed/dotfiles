if [[ $- != *i* ]] return
if command -v tmux > /dev/null; then
  [[ -z $TMUX ]] && (tmux attach || tmux new-session)
fi
