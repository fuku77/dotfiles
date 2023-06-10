#!/bin/bash
# https://github.com/fuku77

maxlen=15;
out="$(mpc current -f %title%)"
pad="$(printf ' %.0s' $(seq 1 $((maxlen + 3 - ${#out}))))"; 
[ "${#out}" -gt "$maxlen" ] && out="${out::maxlen}..." || out="$out$pad"

echo "$out"