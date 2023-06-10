#!/bin/bash
# https://github.com/fuku77/

# USAGE:
# path/to/script value
# path/to/script icon "discharging" "charging"

# DEPENDENCIES:
# acpi

# CONFIG:
sensorUsed="Thermal 0"
useFahrenheit=false
tempPrecision=0 # max: 1


[ $useFahrenheit == true ] && fh="f"
[ $tempPrecision -ge 1 ] && dec='\.\2'

case "$1" in
    "value")
        cmd="acpi -t$fh | sed -n 's/.*:\ .*,\ \([0-9]*\)\.\([0-9]*\)\ degrees\ \([CF]\)/\1$dec°\3/p'"
        echo "$(eval $cmd)"
    ;;
esac