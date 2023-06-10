#!/bin/bash
# https://github.com/fuku77/

# USAGE:
# path/to/script "pausedicon" "runningicon"

[ "$(dunstctl is-paused)" == "false" ] && echo $2 || echo $1
