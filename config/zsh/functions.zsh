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

# Radio Player Function
play_radio() {
    local url="$1"
    mpv --demuxer-lavf-o=max_reload=1000 "$url"
}

# Define stream URLs
BBC_R1="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_one.m3u8"
BBC_R1_DANCE="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_one_dance.m3u8"
BBC_R4="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_fourfm.m3u8"
BBC_R5L="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_five_live.m3u8"
BBC_R5LSX="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_five_live_sports_extra.m3u8"
BBC_R5LSX2="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_five_sports_extra_2.m3u8"
BBC_R5LSX3="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_five_sports_extra_3.m3u8"
BBC_R6="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_6music.m3u8"
BBC_RNORFOLK="http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/uk/pc_hd_abr_v2/ak/bbc_radio_norfolk.m3u8"
TALKSPORT="http://radio.talksport.com/stream?aisGetOriginalStream=true"
TALKSPORT2="http://radio.talksport.com/stream2?awparams=platform:ts-web&amsparams=playerid:ts-web;"
RADIOTOUR="https://ice.creacast.com/lequipe-au1"

# Define play functions
playbbcr1() { play_radio "$BBC_R1"; }
playbbcr1dance() { play_radio "$BBC_R1_DANCE"; }
playbbcr4() { play_radio "$BBC_R4"; }
playbbcr5l() { play_radio "$BBC_R5L"; }
playbbcr5lsx() { play_radio "$BBC_R5LSX"; }
playbbcr5lsx2() { play_radio "$BBC_R5LSX2"; }
playbbcr5lsx3() { play_radio "$BBC_R5LSX3"; }
playbbcr6() { play_radio "$BBC_R6"; }
playradiotour() { play_radio "$RADIOTOUR"; }
playbbcrnorfolk() { play_radio "$BBC_RNORFOLK"; }
playtalksport() { play_radio "$TALKSPORT"; }
playtalksport2() { play_radio "$TALKSPORT2"; }

start-dwl() {
    echo "Starting dwl..."
    dbus-run-session dwl -s ~/.config/dwl/autostart.sh &
    DWL_PID=$!
    
    echo "Waiting for dwl to fully initialize..."
    sleep 5  # Give dwl and autostart script more time
    
    # Wait for systemd to have the D-Bus address
    local attempts=0
    while [ $attempts -lt 10 ]; do
        if systemctl --user show-environment | grep -q DBUS_SESSION_BUS_ADDRESS; then
            export DBUS_SESSION_BUS_ADDRESS=$(systemctl --user show-environment | grep DBUS_SESSION_BUS_ADDRESS | cut -d= -f2-)
            echo "D-Bus synced: $DBUS_SESSION_BUS_ADDRESS"
            break
        fi
        echo "Waiting for D-Bus environment... ($((attempts + 1))/10)"
        sleep 1
        attempts=$((attempts + 1))
    done
    
    if [ $attempts -eq 10 ]; then
        echo "Warning: D-Bus sync may have failed, run 'fix-dbus' if needed"
    fi
    
    wait $DWL_PID  # Wait for dwl to finish
}

fix-dbus() {
    export DBUS_SESSION_BUS_ADDRESS=$(systemctl --user show-environment | grep DBUS_SESSION_BUS_ADDRESS | cut -d= -f2-)
    echo "D-Bus synced for manual commands"
}

restart-mako() {
    fix-dbus
    systemctl --user restart mako.service
    echo "Mako restarted successfully"
}
