#!/bin/sh
set -eu

export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
export XDG_CURRENT_DESKTOP="dwl:wlroots"
export XDG_SESSION_DESKTOP="dwl"
export XDG_SESSION_TYPE="wayland"

# If dwl provided WAYLAND_DISPLAY, publish it to the user manager now
# if [ -n "${WAYLAND_DISPLAY:-}" ]; then
#   # Make future user services/shells see the right socket
#   systemctl --user set-environment WAYLAND_DISPLAY="${WAYLAND_DISPLAY}" DISPLAY=
#   dbus-update-activation-environment --systemd \
#     WAYLAND_DISPLAY XDG_RUNTIME_DIR DBUS_SESSION_BUS_ADDRESS
# fi

systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE XDG_RUNTIME_DIR WAYLAND_DISPLAY
dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE XDG_RUNTIME_DIR WAYLAND_DISPLAY

systemctl --user import-environment PATH

# waybar &
chromium &
# alacritty -e sh -c 'tmux has-session -t work 2>/dev/null && exec tmux attach -t work || exec work' &

