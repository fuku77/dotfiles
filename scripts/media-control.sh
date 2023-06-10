#!/bin/bash
# https://github.com/fuku77

# Dependencies: playerctl, mpc

player=${1:?}
command=${2:?}

if [ "$player" = "playerctl" ]; then
	case $command in
		toggle)
			playerctl play-pause
			;;
		prev)
			playerctl previous
			;;
		next)
			eval playerctl next
			;;
		pos)
			eval playerctl position "$4$3"
			;;
		*)
			notify-send -u critical "Unknown command \"$2\", perhaps it was a typo?"
			;;
	esac
	exit 0
fi
if [ "$player" = "mpc" ]; then
	case $command in
		toggle)
			mpc -q toggle &
			;;
		prev)
			mpc -q prev &
			;;
		next)
			mpc -q next &
			;;
		pos)
			mpc -q seekthrough "$3$4"
			;;
		random)
			mpc -q random
			;;
		repeat)
			mpc -q repeat
			;;
		consume)
			mpc -q consume
			;;
		single)
			mpc -q single
			;;
		stop)
			mpc -q stop
			;;
		*)
			notify-send -u critical "Unknown command \"$2\", perhaps it was a typo?"
			;;
	esac
	exit 0
fi

