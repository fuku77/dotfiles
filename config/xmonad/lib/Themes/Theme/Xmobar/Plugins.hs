-- https://github.com/fuku77/
module Themes.Theme.Xmobar.Plugins where

import Themes.Theme.Config

windowP = "<fc="++colorDom++"><fn=1>\xe988</fn></fc> %_XMONAD_LOG_2%"
storageP = "<fc="++color07++"><fn=1>\xe954</fn></fc> %storage%"
mpdP = "<fc="++color06++"><fn=1>%mpd-icon%</fn></fc>%mpd%"
volP = "<action=\\`pamixer -t\\` button=3>"
    ++"<action=\\`killall pavucontrol || pavucontrol --class=pavucontrol-popup\\` button=1>"
    ++"<action=\\`pamixer -u -i 5\\` button=4>" 
    ++"<action=\\`pamixer -u -d 5\\` button=5>" 
    ++"<fc="++color05++"><fn=1>%vol-icon%</fn></fc> %vol%"
    ++"</action></action></action></action>"
dateP = "<fc="++color04++"><fn=1>\xe927</fn></fc> %date%"
timeP = "<fc="++color03++"><fn=1>\xe939</fn></fc> %time%"
notifP = "<action=\\`eww --config $HOME/.config/xmonad/lib/Themes/Theme/widgets open --toggle notif-main\\` button=1><action=\\`dunstctl set-paused toggle\\` button=3><fc="++color02++"><fn=1>%notif-icon%</fn></fc></action></action>"
powerP = "<action=eww --config $HOME/.config/xmonad/lib/Themes/Theme/widgets open-many --toggle \
        \blur-full \
        \power-menu><fc="++color01++"><fn=1>\xe9c0</fn></fc></action>"
batteryP = "<fc="++color12++"><fn=1>%battery-icon%</fn></fc> %battery%"
tempP = "<fc="++color09++"><fn=1>\xe9ea</fn></fc> %temp%"
seperatorP = "  <fc="++color08++"><fn=2>I</fn></fc>  "
spaceP = "   "
