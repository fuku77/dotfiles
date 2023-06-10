-- https://github.com/fuku77/
module Hooks.Startup where

-- No need to edit this file, edit `autostart` and `autostartOnce` in .xmonad/scripts
import XMonad

import XMonad.Hooks.SetWMName

import XMonad.Util.SpawnOnce

import User.Settings

myStartupHook :: X ()
myStartupHook = do
    -- Looks atrocious but its just passing arguments
    spawn $ "~/.config/xmonad/scripts/setEnv '" 
        ++ myTheme 
        ++ "' '"
        ++ myWallpaper 
        ++ "' '" 
        ++ themePicomSettings 
        ++ "' '" 
        ++ colorBack 
        ++ colorFore 
        ++ color00 
        ++ color01 
        ++ color02 
        ++ color03 
        ++ color04 
        ++ color05 
        ++ color06 
        ++ color07 
        ++ color08 
        ++ color09 
        ++ color10 
        ++ color11 
        ++ color12 
        ++ color13 
        ++ color14 
        ++ color15 
        ++ colorDom
        ++ "' '"
        ++ scriptDir
        ++ "' '"
        ++ mainDir
        ++ "' '"
        ++ myFileBrowser
        ++ "' '"
        ++ myTerminal
        ++ "'  "
    
    spawn $ "~/.config/xmonad/scripts/autostart '"
        ++ themeExecOnRestart 
        ++ "'"

    spawnOnce "~/.config/xmonad/scripts/autostartOnce"
    setWMName "LG3D"
