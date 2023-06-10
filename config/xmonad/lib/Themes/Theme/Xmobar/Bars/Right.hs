-- https://github.com/fuku77/
module Themes.Theme.Xmobar.Bars.Right
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

import Themes.Theme.Xmobar.Plugins
import Themes.Theme.Xmobar.Commands
import Themes.Theme.Helper
import Themes.Theme.Config

barSB xargs barD barU barPrePad = statusBarPropTo "_XMONAD_LOG_4" ("xmobar" ++ barArgs barD barU barPrePad ++ xargs) (clickablePP barPP)

barPP = def

barPad :: Integer
barPad = 0
barWidth :: Integer -> Integer
--barWidth = xmobarTotalWidth `div` 24
barWidth barCurWidth = xmobarTotalWidth - barCurWidth

barCmds :: String
barCmds =
    "[ "++notifIconC++" ]"

barTemplate :: String
barTemplate =
    " }"
    ++notifP++
    "  "
    ++powerP++
    "{ "

barArgs :: ((Integer, Integer) -> String) -> ((Integer, Integer) -> String) -> Integer -> String
barArgs barD barU barPrePad =
    " -p \"" ++ getBarPos barPosition (barD (barPrePad + barPad, barWidth barPrePad), barU (barPrePad + barPad, barWidth barPrePad)) ++
    "\" -c \"" ++ barCmds ++
    "\" -t \"" ++ barTemplate ++ "\""