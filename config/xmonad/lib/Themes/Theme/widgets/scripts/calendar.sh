#!/bin/bash
# https://github.com/fuku77

source ~/.fk/env

cachedir="$HOME/.cache/calendar-widget"
mkdir -p $cachedir
datefile="$cachedir/date"

cal="$(cal -m $(cat $datefile))"

header=$(echo "$cal" | head -1)
weekdays=$(echo "$cal" | tail -n +2 | head -1)
days=$(echo $cal | awk 'NF {DAYS = $NF}; END {print DAYS}')
firstdaypadding="$(date -d "$(cat $datefile)" +'%u')"
firstdaypadding="$((firstdaypadding-1))"

case $1 in
    "header"       ) echo $header;;
    "weekdays"     ) echo $weekdays;;
    "days"         ) echo $days;;
    "padding"      ) echo $firstdaypadding;;
    "revert"       )
        # ! NOTE THAT THIS IS METHOD IS PURELY SPECIFIC TO MY SETUP, WHICH USES RUNIT & THE NTPD DAEMON
        # ! IF YOU USE SYSTEMD & NTPD, USE THIS INSTEAD
        # - $FK_TERMINAL --class "password-prompt" sudo -- sh -c "systemctl stop ntpd; ntpdate -bv pool.ntp.org; systemctl start ntpd;"

        #   if you have a different setup just look up how to manually reset ntpd (or whatever else ur using)
        $FK_TERMINAL --class "password-prompt" sudo -- sh -c "sv stop ntpd; ntpdate -bv pool.ntp.org; sv start ntpd;"

        date +'%Y-%m-%d' > $datefile
        ;;
    "inc-month"    )
        y="$(cat $datefile | sed -n 's/\([0-9]*\)-[0-9]*-[0-9]*/\1/p')"
        m="$(cat $datefile | sed -n 's/[0-9]*-\([0-9]*\)-[0-9]*/\1/p')"
        d="1"
        
        # Month & year overflow
        [ $((m+1)) -gt 12 ] && { { [ $((y+1)) -lt 2038 ] || y=$((y+1)); }; m=1; } || m=$((m+1))

        echo "$y-$(printf "%02d" $m)-$(printf "%02d" $d)" > $datefile
        ;;
    "dec-month"    )
        y="$(cat $datefile | sed -n 's/\([0-9]*\)-[0-9]*-[0-9]*/\1/p')"
        m="$(cat $datefile | sed -n 's/[0-9]*-\([0-9]*\)-[0-9]*/\1/p')"
        d="1"

        # Month & year underflow
        [ $((m-1)) -lt 1 ] && { { [ $((y-1)) -gt 1970 ] || y=$((y-1)); }; m=12; } || m=$((m-1))

        echo "$y-$(printf "%02d" $m)-$(printf "%02d" $d)" > $datefile
        ;;
    "set-year"     )
        y="$2"
        m="$(cat $datefile | sed -n 's/[0-9]*-\([0-9]*\)-[0-9]*/\1/p')"
        d="1"

        # Year underflow
        [ $y -lt 1970 ] && { y=1970; m=1;  d=2;  }
        # Year overflow
        [ $y -gt 2038 ] && { y=2038; m=12; d=31; }

        echo "$y-$(printf "%02d" $m)-$(printf "%02d" $d)" > $datefile
        ;;
    "set-day"      )
        y="$(cat $datefile | sed -n 's/\([0-9]*\)-[0-9]*-[0-9]*/\1/p')"
        m="$(cat $datefile | sed -n 's/[0-9]*-\([0-9]*\)-[0-9]*/\1/p')"
        d="$2"
        
        # Furthest date possible is 1970-01-02, 1970-01-01 breaks seems to break `cal` and `date`
        [[ $y -eq 1970 && $m -eq 1 && $d -eq 1 ]] && d=2

        echo "$y-$(printf "%02d" $m)-$(printf "%02d" $d)" > $datefile
        ;;
    "save-changes" )
        $FK_TERMINAL --class "password-prompt" sudo date --set "$(cat $datefile)"
        ;;

esac