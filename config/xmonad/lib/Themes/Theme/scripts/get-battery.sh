#!/bin/bash
# https://github.com/fuku77/

# USAGE:
# path/to/script value
# path/to/script icon "discharging" "charging"

# DEPENDENCIES:
# acpi
 

# CONFIG:
batteryUsed="Battery 0"

case "$1" in 
    "value")
        cmd="acpi -b | sed -n 's/$batteryUsed:\ .*,\ \([0-9]*\)\%.*/\1/p'"
        echo "$(eval $cmd)%"
    ;;
    "icon")
        discharging="$2"
        charging="$3"
        cmd="acpi -b | sed -n 's/$batteryUsed:\ \(.*\),\ [0-9]*\%.*/\1/p'"
        case "$(eval $cmd)" in
            "Discharging") echo "$discharging";;
            "Charging") echo "$charging";;
            "Full") echo "$discharging";;
        esac
    ;;
esac