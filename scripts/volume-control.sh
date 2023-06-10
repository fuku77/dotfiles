#!/usr/bin/env sh
# https://github.com/fuku77

# Dependencies: pamixer

icons="$HOME/.icons/feather-blue"
action=${1:?}
value=$2
notifID=7777

send_notif () {
	title=${1:?}
	summary=$2
	notify-send -u normal \
		-t 1000 \
		-i "$(~/.scripts/get-vol-level.sh "$icons/volume-x.png" "$icons/volume.png" "$icons/volume-1.png" "$icons/volume-2.png")" \
		-r "$notifID" \
		"$title" \
		"$summary"
}

case $action in
	toggle-mute)
		pamixer -t &&
		send_notif "Volume level:" "$(pamixer --get-volume-human)"
		;;
	decr)
		pamixer -u -d "$value" &&
		send_notif "Lower Volume:" "$(pamixer --get-volume-human)"
		;;
	incr)
		pamixer -u -i "$value" &&
		send_notif "Raise Volume:" "$(pamixer --get-volume-human)"
		;;
esac
