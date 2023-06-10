-- https://github.com/fuku77
-- vim: syntax=haskell
module User.Settings 
    ( myTheme
    , myWallpaper
    , myTerminal
    , myEditor
    , myFileBrowser
    , myMusicPlayer
    , myBrowser
    , myBrowserClass
    , myMusicPlayerClass
    , scriptDir
    , mainDir
    , myFocusFollowsMouse
    , myClickJustFocuses
    , myModMask
    , T.themeSB
    , T.themeWorkspaces
    , T.themePicomSettings
    , T.themeFont
    , T.themeSpacing
    , T.themeBorderWidth
    , T.themeNormalBorderColor
    , T.themeFocusedBorderColor
    , T.themeExecOnRestart
    , T.themeKeybindings
    , T.colorBack
    , T.colorFore
    , T.color00
    , T.color01
    , T.color02
    , T.color03
    , T.color04
    , T.color05
    , T.color06
    , T.color07
    , T.color08
    , T.color09
    , T.color10
    , T.color11
    , T.color12
    , T.color13
    , T.color14
    , T.color15
    , T.colorDom
    , T.colorSel
    ) where

import XMonad

-- -- -- -- -- -- -- -- 
-- -- Look & feel -- --
-- -- -- -- -- -- -- --
-- To configure the themes edit the Config.hs file (if any) in the theme's folder
-- or directly edit the theme files noone's stopping you

-- Valid options:
-- Themes.Theme.Theme
import qualified Themes.Theme.Theme as T

-- Valid options:
-- Theme
myTheme = "Theme"

-- path/to/wallpaper 
-- (set on restart)
-- T.themeWallpaper to use the theme's wallpaper 
-- leave as "" if you dont want xmonad to handle this

myWallpaper = T.themeWallpaper
--myWallpaper = ""

-- -- -- --  -- -- -- --
-- -- Applications -- --
-- -- -- --  -- -- -- --

myTerminal = "kitty "

myEditor = "nvim"

--myFileBrowser = myTerminal ++ "-e ranger"
myFileBrowser = "thunar"

myBrowser = "firefox"

myMusicPlayer = "music " ++ myTerminal

-- Additional app info

myBrowserClass = "Firefox"

myMusicPlayerClass = "ncmpcpp"

-- -- -- -- -- -- -- --
-- -- Directories -- --
-- -- -- -- -- -- -- --
-- You generally shouldn't need to change these
-- unless you want to use a folder structure different
-- from mine

scriptDir = "$HOME/.scripts"
mainDir = "$HOME/.fk"

-- -- -- -- - - -- -- -- --
-- -- XMONAD SETTINGS -- --
-- -- -- -- - - -- -- -- --

myFocusFollowsMouse = True

myClickJustFocuses = True

-- i use caps as Super btw
myModMask :: KeyMask
myModMask = mod4Mask
