-- https://github.com/fuku77/
module Themes.Theme.Xmobar.Bars.Left
    ( barSB
    , barPP
    , barPad
    , barWidth
    , barCmds
    , barTemplate
    , barArgs
    ) where

import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.StatusBar
import XMonad.Util.ClickableWorkspaces

import Themes.Theme.Helper
import Themes.Theme.Config

barSB xargs barD barU barPrePad = statusBarPropTo "_XMONAD_LOG_1" ("xmobar" ++ barArgs barD barU barPrePad ++ xargs) (clickablePP barPP)

barPP = def
    { ppLayout          = wrap "" ""
    , ppTitle           = shorten 30
    , ppCurrent         = xmobarFont 1 . xmobarColor colorSel "" . replace wsHiddenNoWin wsCurrent -- genius i know
    , ppHidden          = xmobarFont 1 . xmobarColor colorDom "" . replace wsHiddenNoWin wsHidden
    , ppHiddenNoWindows = xmobarFont 1 . xmobarColor colorDom ""
    , ppSep             = "   "
    , ppWsSep           = " "
    , ppOrder           = \(ws : _ : _ : _) -> [ws]
}

barPad :: Integer
barPad = 0
barWidth :: Integer -> Integer
--barWidth barCurWidth = xmobarTotalWidth `div` 7 + xmobarTotalWidth `div` 384
barWidth barCurWidth = (xmobarTotalWidth - barCurWidth) `div` 11 + (xmobarTotalWidth - barCurWidth) `div` 135 -- 384

barCmds :: String
barCmds = 
--    "[ "++mpdC++
--    ", "++mpdIconC++
--    ", "++dateC++
--    ", "++timeC++
--    ", "++volC++
--    ", "++volIconC++
--    ", "++notifIconC++
    "[ Run UnsafeXPropertyLog \\\"_XMONAD_LOG_1\\\" ]"

barTemplate :: String
barTemplate = 
    " }<action=\\`xdotool key Super_L+Left\\` button=5>"
    ++"<action=\\`xdotool key Super_L+Right\\` button=4>"
    ++"%_XMONAD_LOG_1%</action></action>{ "
--    ++mpdP++"   "
--    ++volP++"   "
--    ++dateP++"   "
--    ++timeP++"   "
--    ++notifP++"  "
--    ++powerP++" "

barArgs :: ((Integer, Integer) -> String) -> ((Integer, Integer) -> String) -> Integer -> String
barArgs barD barU barPrePad = 
    " -p \"" ++ getBarPos barPosition (barD (barPrePad + barPad, barWidth barPrePad), barU (barPrePad + barPad, barWidth barPrePad)) ++
    "\" -c \"" ++ barCmds ++
    "\" -t \"" ++ barTemplate ++ "\""
