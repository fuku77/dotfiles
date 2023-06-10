-- https://github.com/fuku77/
module Themes.Theme.Xmobar.Xmobar where

import Themes.Theme.Config

import qualified Themes.Theme.Xmobar.Bars.Left as Left
import qualified Themes.Theme.Xmobar.Bars.Middle as Middle
import qualified Themes.Theme.Xmobar.Bars.Right as Right
themeSB = 
    Left.barSB xmobarArgs xmobarPosD xmobarPosU 0 <> 
    Middle.barSB xmobarArgs xmobarPosD xmobarPosU 
    (Left.barPad + Left.barWidth 0 + barSpacing) <>
    Right.barSB xmobarArgs xmobarPosD xmobarPosU 
    (Left.barPad + Left.barWidth 0 + barSpacing + Middle.barPad + Middle.barWidth (Left.barPad + Left.barWidth 0 + barSpacing) + barSpacing)

themeFont :: String
themeFont = "xft:JetBrains Mono Nerd Font:size=9" -- 10/9

xmobarAddFont :: String 
xmobarAddFont = "xft:feather:size=11" -- 12

-- POSITION & SIZE

xmobarH :: Integer
xmobarH = screenHeight `div` 42 -- 34

xmobarPosU :: (Integer, Integer) -> String
xmobarPosU (xpad, width) = "\
    \  Static \
    \{ xpos   = " ++ show (barSpacing + xpad) ++ "\
    \, ypos   = " ++ show barSpacing ++ "\
    \, width  = " ++ show width ++ "\
    \, height = " ++ show xmobarH ++ " }"

xmobarPosD :: (Integer, Integer) -> String
xmobarPosD (xpad, width) = "\
    \  Static \
    \{ xpos   = " ++ show (barSpacing + xpad) ++ "\
    \, ypos   = " ++ show (screenHeight - xmobarH - barSpacing) ++ "\
    \, width  = " ++ show width ++ "\
    \, height = " ++ show xmobarH ++ " }"

-- put all args into one string
xmobarArgs :: [Char]
xmobarArgs = 
    " -B \"" ++ colorBack ++
    "\" -F \"" ++ colorFore ++ 
    "\" -f \"" ++ themeFont ++ 
    "\" -N \"" ++ xmobarAddFont ++ 
    "\" -N \"" ++ "xft:Source Han Sans JP:style=Regular:size=9" ++ "\""

-- OTHER
xmobarExtraArgs :: String
xmobarExtraArgs = ""
