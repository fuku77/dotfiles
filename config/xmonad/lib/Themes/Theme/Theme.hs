-- https://github.com/fuku77/
module Themes.Theme.Theme 
    ( themeWorkspaces
    , themeWallpaper
    , themePicomSettings
    , themeSB
    , themeFont
    , themeSpacing
    , themeBorderWidth
    , themeNormalBorderColor
    , themeFocusedBorderColor
    , themeExecOnRestart
    , themeKeybindings
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
    , color15
    -- might change/remove these 2
    , colorDom
    , colorSel) where

-- -- This is the main theme file.
-- -- All the other files in this folder aren't necessary,
-- -- all you need in a theme is to export the same variables as above (and have them as their correct types obviously)

import XMonad 

import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.Spacing

import XMonad.Util.NamedActions
import XMonad.Util.EZConfig
import XMonad.Util.Run

import Themes.Theme.Xmobar.Xmobar

import Themes.Theme.Config

-- -- -  - -- --
-- Workspaces --
-- -- -  - -- -- 

-- we are using \x0 here to differentiate the workspaces (same name causes weird bugs)
themeWorkspaces = 
    [ xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 0 "\x0"))
    , xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 1 "\x0"))
    , xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 2 "\x0"))
    , xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 3 "\x0"))
    , xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 4 "\x0"))
    , xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 5 "\x0"))
    , xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 6 "\x0"))
    , xmobarFont 1 (wsHiddenNoWin ++ concat (replicate 7 "\x0"))]

-- -- - -- --
-- Spacing --
-- -- - -- --

themeSpacing = 
    spacingRaw 
    False 
    (Border 
    (read (show themeSpacingSize) :: Integer) 
    (read (show themeSpacingSize) :: Integer) 
    (read (show themeSpacingSize) :: Integer) 
    (read (show themeSpacingSize) :: Integer)) 
    True 
    (Border 
    (read (show themeSpacingSize) :: Integer)
    (read (show themeSpacingSize) :: Integer)
    (read (show themeSpacingSize) :: Integer)
    (read (show themeSpacingSize) :: Integer)) 
    True

-- -- - -- --
-- Execute --
-- -- - -- --

themeExecOnRestart :: String
themeExecOnRestart = "source $HOME/.config/xmonad/lib/Themes/Theme/scripts/onRestart"

-- -- -- -- -- --
-- Keybindings --
-- -- -- -- -- --

themeKeybindings = 
    [ ("M-`",     addName "Toggle Dashboard"           $ spawn "eww --config $HOME/.config/xmonad/lib/Themes/Theme/widgets open-many --toggle \
        \ blur-full             \
        \ dashboard-time        \
        \ dashboard-weather     \
        \ dashboard-sysfetch    \
        \ dashboard-profile     \
        \ dashboard-apps        \
        \ dashboard-volume      \
        \ dashboard-directories \
        \ dashboard-fortune     \
        \ dashboard-music       \
        \ dashboard-hardware    \
        \ dashboard-powerbuttons")
    , ("M-<Esc>", addName "Toggle Power Menu"          $ spawn "eww --config $HOME/.config/xmonad/lib/Themes/Theme/widgets open-many --toggle \
        \blur-full \
        \power-menu")
    , ("M-n",     addName "Toggle Notification Center" $ spawn "eww --config $HOME/.config/xmonad/lib/Themes/Theme/widgets open-many --toggle notif-main")]