if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_PID
fi
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
GPG_TTY=$(tty)
export GPG_TTY
echo UPDATESTARTUPTTY | gpg-connect-agent >> /dev/null
