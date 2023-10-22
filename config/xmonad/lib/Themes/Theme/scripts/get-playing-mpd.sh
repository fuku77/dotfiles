#!/bin/bash
# https://github.com/fuku77/

# USAGE:
# path/to/script title
# path/to/script icon "iconchar"

maxlength=18

case "$1" in
	title)
    	if [ -z "$(mpc current)" ]; then 
			echo -n " N/A"
		else 
    		# Set output to playing track's title
			out="$(mpc current -f %title%)"

			# Truncate or pad output, depending on size.
			# $pad repeats the character c in "c%.0s" x times, x being (maxlength - out) / 2
	    	# this is actually half a pad, so use it like $pad$out$pad
			pad="$(printf ' %.0s' $(seq 1 $(( ( (maxlength - ${#out} + 3) + 1 ) / 2)) ))"

			# [ "${#out}" -ge "$maxlength" ] && out="${out::maxlength}"... || out="$pad$out$pad";;
			[ "${#out}" -gt "$maxlength" ] && out="${out::maxlength}..." || out="$out"
    		echo -n " $out" 
		fi;;

  # This outputs the second argument unless mpd is stopped
	# WONT output the cover art for the current track
	icon)
		out="$2"
    	echo "$out";;
esac

