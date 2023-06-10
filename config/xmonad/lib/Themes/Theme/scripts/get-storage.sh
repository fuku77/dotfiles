#!/usr/bin/env sh
# https://github.com/fuku77/

device=${1:-/home}
df -h "$device" --output="used,size" | tail -1 | sed 's_\ *\([0-9]\+\)G\ \+\([0-9]\+\)G\ *_\1 / \2 GB_'
