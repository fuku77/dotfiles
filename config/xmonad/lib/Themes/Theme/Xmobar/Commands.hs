-- https://github.com/fuku77/
module Themes.Theme.Xmobar.Commands where

-- Commands for xmobar
-- XProperty logs are defined in Bars/BarName.hs

-- ! If you're adding a new command, don't forget to add it to the respective bar's commands section !

import Themes.Theme.Helper ( escapeQuotes )

storageC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-storage.sh \\\"$HOME\\\" \"] \"storage\" 10"

mpdC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-playing-mpd.sh title\"] \"mpd\" 10"

mpdIconC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-playing-mpd.sh icon \xe97c \"] \"mpd-icon\" 1"

dateC = escapeQuotes "Run Com \"date\" [ \"+%d/%m\" ] \"date\" 10"

timeC = escapeQuotes "Run Com \"date\" [ \"+%H:%M\" ] \"time\" 1"

volC = escapeQuotes "Run Com \"pamixer\" [ \"--get-volume-human\" ] \"vol\" 1"

volIconC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-vol-level.sh \xea0c \xea09 \xea0a \xea0b \"] \"vol-icon\" 1"

notifIconC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-notif-icon.sh \xe9a3 \xe91e \"] \"notif-icon\" 1"

batteryC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-battery.sh value\"] \"battery\" 5"

batteryIconC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-battery.sh icon \xe91c \xe91d \"] \"battery-icon\" 5"

tempC = escapeQuotes "Run Com \"bash\" [\"-c\", \"~/.fk/Theme/scripts/get-temp.sh value\"] \"temp\" 5"