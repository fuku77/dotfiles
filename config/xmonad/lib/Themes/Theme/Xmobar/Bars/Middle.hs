-- https://github.com/fuku77/
module Themes.Theme.Xmobar.Bars.Middle
    ( barSB
    , barPP
    , barPad
    , barWidth
    , barCmds
    , barTemplate
    , barArgs
    ) where

import Data.List

import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.StatusBar
import XMonad.Util.ClickableWorkspaces

import Themes.Theme.Xmobar.Plugins
import Themes.Theme.Xmobar.Commands
import Themes.Theme.Helper
import Themes.Theme.Config

barSB xargs barD barU barPrePad = statusBarPropTo "_XMONAD_LOG_2" ("xmobar" ++ barArgs barD barU barPrePad ++ xargs) (clickablePP barPP)

barPP = def
    { ppTitle           = shorten 64
    , ppOrder           = \( _ : _ : t : _) -> [t]
    }

barPad :: Integer
barPad = 0
barWidth :: Integer -> Integer
--barWidth = xmobarTotalWidth `div` 2 + xmobarTotalWidth `div` 3 - xmobarTotalWidth `div` 32
barWidth barCurWidth = (xmobarTotalWidth - barCurWidth) - ((xmobarTotalWidth - barCurWidth) `div` 20)

barCmds :: String
barCmds = 
    "[ "++
    storageC++
    ", "++mpdC++
    ", "++mpdIconC++
    ", "++dateC++
    ", "++timeC++
    ", "++volC++
    ", "++volIconC++
    ", "++batteryC++
    ", "++batteryIconC++
    ", "++tempC++
    ", Run XPropertyLog \\\"_XMONAD_LOG_2\\\" ]"

barPlugins :: [String]
barPlugins = 
    [ windowP
    , "}{"
    , tempP
    , spaceP
    , batteryP
    , seperatorP
    , mpdP
    , spaceP
    , volP
    , seperatorP
    , dateP
    , spaceP
    , timeP
    ]

barTemplate :: String
barTemplate = " " ++ (replace "\n" "" $ unlines barPlugins) ++ " "


barArgs :: ((Integer, Integer) -> String) -> ((Integer, Integer) -> String) -> Integer -> String
barArgs barD barU barPrePad = 
    " -p \"" ++ getBarPos barPosition (barD (barPrePad + barPad, barWidth barPrePad), barU (barPrePad + barPad, barWidth barPrePad)) ++
    "\" -c \"" ++ barCmds ++
    "\" -t \"" ++ barTemplate ++ "\""
