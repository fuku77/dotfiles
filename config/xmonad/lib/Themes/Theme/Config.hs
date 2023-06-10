-- https://github.com/fuku77/
-- vim: syntax=haskell
module Themes.Theme.Config
    ( wsHiddenNoWin
    , wsHidden
    , wsCurrent
    , colorDom
    , colorSel
    , themeSpacingSize
    , screenWidth
    , screenHeight
    , xmobarTotalWidth
    , barPosition
    , barSpacing
    , themeWallpaper
    , themePicomSettings
    , themeBorderWidth
    , themeNormalBorderColor
    , themeFocusedBorderColor
    , colorBack
    , colorFore
    , color00
    , color01
    , color02
    , color03
    , color04
    , color05
    , color06
    , color07
    , color08
    , color09
    , color10
    , color11
    , color12
    , color13
    , color14
    , color15) where

import XMonad
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Types

-- - -- - --
-- Colors --
-- - -- - --

-- This will also apply to applications like rofi, dunst, alacritty etc.
-- setting the colors for these applications is done in theme/scripts/onRestart

-- This theme was made for use with the Tokyo Night colorscheme, will need some tweaks to look good using others
-- Look inside lib/Colors for different options
import Colors.TokyoNight

-- -  - --
-- User --
-- -  - --
-- Valid Options: 
-- U
-- D
barPosition :: Direction2D
barPosition = U

screenWidth = 1920
screenHeight = 1080

themeWallpaper = ".wallpapers/1653864568856_1628035900200.png"

themePicomSettings = "--corner-radius 8"

themeBorderWidth :: Dimension
themeBorderWidth = 0

themeNormalBorderColor = color08
themeFocusedBorderColor = color06

-- -- -- - - -- -- --
-- Workspace Icons --
-- -- -- - - -- -- --
wsHiddenNoWin = "\xe937"
--wsHidden      = xmobarFont 1 "\xe9b9"
wsHidden      = "\xe937"
wsCurrent     = "\xe937"

-- I suggest you don't change anything down here unless you like math
themeSpacingSize :: Integer
themeSpacingSize = screenWidth `div` 240

xmobarTotalWidth = screenWidth - (screenWidth `div` 60)

-- Spacing in-between bars
barSpacing = screenWidth `div` 120
