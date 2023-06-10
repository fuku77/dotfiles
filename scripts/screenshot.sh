#!/usr/bin/env sh
# https://github.com/fuku77

# Depends on: optipng, scrot

action="${1:?}"

scrotdir="$HOME/Pictures/Screenshots/$(date +"%Y-%m")"

mkdir -p "$scrotdir" && cd "$scrotdir" || exit

quality=100 # 1-100
filename='%Y-%m-%d-%H-%M_%s.png' # For more info on special strings, see 'man scrot'

# These are specific for select area mode
mode=classic
style="dash" # "solid" or "dash".
width=3 # width is a pixel count between 1 and 8.
color="#B3957D"
opacity=255 # between 0 and 255.

send_notif () {
	notify-send -t 2000 -i "$HOME/.icons/feather-blue/camera.png" 'Taking a screenshot!' "Saved to $f"
}

case $action in
    full)
        scrot -q "$quality" "$filename" \
        -e 'optipng $f' \
        -e 'xclip -selection clipboard -t image/png -i $f && send_notif'
        ;;
    area)
        scrot -q "$quality" -l "mode=$mode,style=$style,width=$width,color=$color,opacity=$opacity" "$filename" -f -s \
        -e 'optipng $f' \
        -e 'xclip -selection clipboard -t image/png -i $f'
        ;;
    *)
        exit 1;;
esac
