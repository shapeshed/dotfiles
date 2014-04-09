#!/usr/bin/env sh

: "${ircdir:=$HOME/irc}"
: "${nick:=$USER}"

# server info functions
bitlbee() {
  server='127.0.0.1'
  channels="#twitter_shapeshed"
  port=6668
}

campfire() {
  server='localhost'
  channels="#bede_bingo_team"
}

freenode() {
  server='173.255.248.188'
  port=6557
  channels="#archlinux #node.js"
}

bedegaming() {
  server='173.255.248.188'
  channels="#team-bingo #_SOS"
  port=6557
}

# these match the functions above
networks="freenode bedegaming"

# some privacy please, thanks
chmod 700 "$ircdir"
chmod 600 "$ircdir"/*/ident &>/dev/null

for network in $networks; do
	unset server channels port
	"$network" # set the appropriate vars

	while true; do
		# cleanup
		rm -f "$ircdir/$server/in"

    # connect to netwrok -- password is set through the env var synonym to the network name
    # iim -i "$ircdir" -n "$nick" -k "$network" -s "$server" -p "${port:-6667}" &
    if [[ $ssl ]]
    then 
      ii -e ssl -i "$ircdir" -n "$nick" -k "$network" -s "$server" -p "${port:-6667}" &
    else
      ii -i "$ircdir" -n "$nick" -k "$network" -s "$server" -p "${port:-6667}" &
    fi 
		pid="$!"

		# wait for the connection
		while ! test -p "$ircdir/$server/in"; do sleep .3; done

		# auth to services
		if [ -e "$ircdir/$server/ident" ]
		then printf "/j nickserv identify %s\n" "$(cat "$ircdir/$server/ident")" > "$ircdir/$server/in"
		fi && rm -f "$ircdir/$server/nickserv/out" # clean that up - ident passwd is in there

		# join channels
		printf "/j %s\n" $channels > "$ircdir/$server/in"

		# if connection is lost reconnect
		wait "$pid"
	done &
done

