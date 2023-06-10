#!/usr/bin/env bash
# https://github.com/fuku77

# minor spelling mistake

# Just a little daemon script that runs in the bg
# Does what it says in the name.

cd /
umask 0

# Kill all other instances
kill $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)

# Start mpd if it's not running
mpc > /dev/null || mpd 

song_id="7757"

send_mpd_notification () {
        args="${1:?}"
	
        [ -n "$(echo "$args" | grep -w 'cover')" ]      && cover="$cover_path"
        [ -n "$(echo "$args" | grep -w 'title')" ]      && title="$(mpc current -f %title%)" #&& 
#		{ [ "${#title}" -gt 38 ] && title="${title::38}...";}
        [ -n "$(echo "$args" | grep -w 'artist')" ]     && artist="\nby $(mpc current -f %artist%)" #&&
#		{ [ "${#artist}" -gt 18 ] && artist="${artist::18}...";}
        [ -n "$(echo "$args" | grep -w 'nowplaying')" ] && nowplaying="Now $(mpc status %state%):"
        [ -n "$(echo "$args" | grep -w 'random')" ]     && random="\n\n$(mpc status 'z: %random%')"
        [ -n "$(echo "$args" | grep -w 'repeat')" ]     && repeat="$(mpc status 'r: %repeat%')"
        [ -n "$(echo "$args" | grep -w 'single')" ]     && single="$(mpc status 's: %single%')"
        [ -n "$(echo "$args" | grep -w 'consume')" ]    && consume="$(mpc status 'c: %consume%')"
	[ -n "$(echo "$args" | grep -w 'bar')" ]        && bar="-h int:value:$(mpc status '%percenttime%' | sed 's/%// ; s/\ //')"

        notify-send -t 4000 -a "mpd" $bar -i "${cover:- }" -r "$song_id" "${nowplaying:- }" "$title$artist$random $repeat $single $consume"
}

# We use the find_cover_image function from ncmpcpp-ueberzug
. $HOME/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp_cover_art.sh

# Main loop
while true;
do
	# Song changed
	if [ ! "$(mpc current)" = "$current" ]; then
		[ -z "$(mpc current)" ] && continue
		current="$(mpc current)"
        	find_cover_image
		send_mpd_notification "nowplaying cover title artist"
	fi
	# Play/Pause state changed
	if [ ! "$(mpc status %state%)" = "$state" ]; then
		state="$(mpc status %state%)"
		send_mpd_notification "nowplaying cover title artist"
	fi
	sleep 0.1
done
