#!/bin/bash
set -e
playlistdir=/var/lib/mpd/playlists

declare -A radios
radios["BBC Radio 1"]="http://www.bbc.co.uk/radio/listen/live/r1_aaclca.pls"
radios["BBC Radio 2"]="http://www.bbc.co.uk/radio/listen/live/r2_aaclca.pls"
radios["BBC Radio 3"]="http://www.bbc.co.uk/radio/listen/live/r3_aaclca.pls"
radios["BBC Radio 4"]="http://www.bbc.co.uk/radio/listen/live/r4_aaclca.pls"
radios["BBC Radio 4 LW"]="http://www.bbc.co.uk/radio/listen/live/r4lw_aaclca.pls"
radios["BBC Radio 4 Extra"]="http://www.bbc.co.uk/radio/listen/live/r4x_aaclca.pls"
radios["BBC Radio 5 Live"]="http://www.bbc.co.uk/radio/listen/live/r5l_aaclca.pls"
radios["BBC Radio 5 Sports Extra"]="http://www.bbc.co.uk/radio/listen/live/r5lsp_aaclca.pls"
radios["BBC 6 Music"]="http://www.bbc.co.uk/radio/listen/live/r6_aaclca.pls"

for k in "${!radios[@]}"; do
  filepath="${playlistdir}/${k}.m3u"
  rm -f "$filepath"
  echo "#EXTM3U" >>"$filepath"
  pls=${radios[$k]}
  echo "#EXTINF:-1, BBC - $k" >>"$filepath"
  curl -s $pls | grep File1 | sed 's/File1=\(.*\)/\1/' >>"$filepath"
done
