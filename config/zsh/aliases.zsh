# Vim
alias v="vim"
alias vim="hx"

# Always edit crontab with Vim
alias crontab="VIM_CRONTAB=true crontab"

# Git
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gl='git pull'
alias gp='git push'
alias gc='git commit'
alias gd='git diff'
alias git commit='git commit -S'

alias castget='castget -C ~/.config/castget/castgetrc'
alias goaccess='goaccess -p ~/.config/goaccess/goaccessrc'

# alias k="kak"
# K8S
alias k="kubectl"
alias kl="kubectl logs"

alias ls="ls --color"

alias neomutt="TERM=xterm-direct neomutt"

alias start-dwl-and-sync='dbus-run-session dwl -s ~/.config/dwl/autostart.sh & sleep 6 && eval "export DBUS_SESSION_BUS_ADDRESS=\$(systemctl --user show-environment | grep DBUS_SESSION_BUS_ADDRESS | cut -d= -f2-)" && echo "D-Bus synced!" && wait'

