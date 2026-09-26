# The opencode background service reads its password from
# $XDG_CONFIG_HOME/opencode/service.json and ignores $OPENCODE_PASSWORD for
# that mode, so a password chosen at the prompt has to be recorded there.
#
# The file is gitignored and never committed to this repo. Delete it to be
# prompted again.
opencode_service_password() {
  local config="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/service.json"

  # Already recorded a password, nothing to do.
  if [[ -f $config ]] && jq -e 'has("password")' "$config" >/dev/null 2>&1; then
    return 0
  fi

  local password
  print -n "opencode service password: " >&2
  # read from the terminal explicitly so this still works when opencode is
  # invoked from a script or a pipeline with stdin redirected.
  if ! read -rs password </dev/tty; then
    # No terminal available (cron, CI, a subshell). Fall through and let
    # opencode generate a random password for this run.
    return 1
  fi
  print >&2

  if [[ -z $password ]]; then
    print "opencode: no password entered, opencode will generate a random one" >&2
    return 1
  fi

  mkdir -p "${config:h}" || return 1

  # Preserve any other keys (hostname, port, cors, env) already present.
  local existing='{}'
  [[ -f $config ]] && existing=$(<"$config")
  if print -r -- "$existing" |
       jq --arg password "$password" '.password = $password' > "${config}.tmp" 2>/dev/null
  then
    mv "${config}.tmp" "$config"
  else
    rm -f "${config}.tmp"
    print -r -- "opencode: could not write $config" >&2
    return 1
  fi
  chmod 600 "$config" 2>/dev/null
}

# Wrap opencode so the password is captured on first use. Uses `command` to
# avoid recursing into this function.
opencode() {
  opencode_service_password
  command opencode "$@"
}
