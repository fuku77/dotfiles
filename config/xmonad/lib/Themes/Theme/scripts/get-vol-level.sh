#!/bin/bash
# https://github.com/fuku77

# USAGE:
# path/to/script "mute" "low" "mid" "high"

mute=$1
low=$2
mid=$3
high=$4

[ "$(pamixer --get-volume-human)" == "muted" ] && echo $mute && exit
[ "$(pamixer --get-volume)" -ge 65 ] && echo $high && exit
[ "$(pamixer --get-volume)" -ge 35 ] && echo $mid && exit
[ "$(pamixer --get-volume)" -ge 1 ] && echo $low && exit
[ "$(pamixer --get-volume)" -eq 0 ] && echo $mute && exit
