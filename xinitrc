#!/usr/bin/env sh

xset +fp /usr/share/fonts/local
xset fp rehash
xbindkeys
xautolock -locker slock -time 2 -killer "systemctl suspend" -killtime 10 &

PACMANICON=$(echo -e '\u2691')
AURICON=$(echo -e '\u2690')
BATTICON=$(echo -e '\u26A1')
BATTSTATUS=''

while true; do

  if which acpi &> /dev/null; then
    BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
    STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )

    if [ $STATUS == 'Discharging' ]; then
      BATTSTATUS="$BATTICON $BATT"
    fi
  fi

  PACMAN_UPDATES=$(pacman -Qu | wc -l)
  AUR_UPDATES=$(cower -u | wc -l)

  xsetroot -name "$PACMANICON $PACMAN_UPDATES $AURICON $AUR_UPDATES $BATTSTATUS $(date +"%F %R")" 

  sleep 1m

done &
eval $(gpg-agent --daemon --enable-ssh-support --write-env-file ${HOME}/.gpg-agent-info)
exec dwm
