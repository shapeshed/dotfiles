# mkcd - make a directory and change to it
#
# This makes a directory with parents and changes into it
# mkdir /some/path/that/does/not/exist
# pwd
# /some/path/that/does/not/exist
#
function mkdircd {
	mkdir -p "$*"
	cd "$*"
}

# gr - search recursively with grep
function gr {
	grep -R "$*" .
}

function weather {
	curl wttr.in/$1
}

# Saves repeating ps aux | grep foo
function psg {
	ps wwwaux | grep -E "($1|%CPU)" | grep -v grep
}

function wifi {
	sudo wpa_supplicant -c /etc/wpa_supplicant/"$*".conf -i wlp0s20f3 -B
}

# function t {
# 	task add "$*" +do +work due:eod
# }

# Print a summary for standup
function standup {
	if [[ $(date '+%a') == "Mon" ]]; then
		task end:today-3days completed +work
	else
		task end:yesterday completed +work
	fi
	task end:today completed
	task +work
}
