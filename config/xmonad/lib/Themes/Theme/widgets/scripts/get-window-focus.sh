#!/bin/bash
# https://github.com/fuku77

maxlen=50
windowname="$(xdotool getwindowfocus getwindowname)"

[ ${#windowname} -gt $maxlen ] && out="${windowname::maxlen}..." || out="$windowname"

echo "$out"
