#!/bin/bash
# https://github.com/fuku77

CACHE_DIR="$HOME/.cache/eww/internet"
PING_CACHE="$CACHE_DIR/ping"
DOWN_CACHE="$CACHE_DIR/download"
UP_CACHE="$CACHE_DIR/upload"

mkdir -p "$CACHE_DIR"

data=$(curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -)

# Cache ping
echo "$data" | sed -n 's/.*:\ \(.*\ ms\)/\1/p' > "$PING_CACHE"

# Cache download
echo "$data" | sed -n 's/Download:\ \(.*\)/\1/p' > "$DOWN_CACHE"

# Cache upload
echo "$data" | sed -n 's/Upload:\ \(.*\)/\1/p' > "$UP_CACHE"