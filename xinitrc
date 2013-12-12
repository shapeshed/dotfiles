xset +fp /usr/share/fonts/local
xset fp rehash
xautolock -locker slock -time 2 -killer "systemctl suspend" -killtime 10 &

PACMANICON=$(echo -e '\uE00F')
AURICON=$(echo -e '\uE00E')
while true; do
  PACMAN_UPDATES=$(pacman -Qu | wc -l)
  AUR_UPDATES=$(cower -u | wc -l)
  xsetroot -name "$PACMANICON $PACMAN_UPDATES $AURICON $AUR_UPDATES $(date +"%F %R")" 
  sleep 1m
done &
exec dwm
