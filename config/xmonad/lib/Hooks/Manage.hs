-- https://github.com/fuku77/
module Hooks.Manage where

import XMonad
import XMonad.StackSet

import Control.Lens
import Data.Maybe

import XMonad.Actions.SpawnOn

import XMonad.Hooks.ManageDocks
import qualified XMonad.Hooks.ManageHelpers as MH

import XMonad.Layout.Fullscreen

import User.Settings

myManageHook :: ManageHook
myManageHook =
    manageSpawn
    <+> fullscreenManageHook
    <+> composeAll
        [ MH.isFullscreen                                                   --> MH.doFullFloat
	
	-- Float
        , className =? "MPlayer"                                            --> doFloat
        , className =? "Gimp"                                               --> doFloat
        , className =? "Nitrogen"                                           --> doFloat
        , title     =? "Picture in Picture"                                 --> doFloat
        , title     =? "Picture-in-Picture"                                 --> doFloat
        , title     =? "Steam Guard - Computer Authorization Required"      --> doFloat
        
	-- Center Float
        , className =? "Gifview"                                            --> MH.doCenterFloat
        , className =? "feh"                                                --> MH.doCenterFloat
        , className =? "Pavucontrol"                                        --> MH.doCenterFloat
        , className =? "Sxiv"                                               --> MH.doCenterFloat
        , className =? "Thunar"                                             --> MH.doRectFloat (RationalRect 0.25 0.25 0.5 0.5)
        , className =? "Galculator"                                         --> MH.doCenterFloat
        , className =? "roblox_installer.exe"                               --> MH.doCenterFloat
	, className =? "password-prompt"                                    --> MH.doRectFloat (RationalRect 0.370 0.46875 0.25 0.0625)
        , appName   =? "ncmpcpp"                                            --> MH.doCenterFloat <> MH.doFocus -- (RationalRect 0.275 0.3313 0.45 0.3375)
	, title     =? "XMonad Keybindings"                                 --> MH.doCenterFloat
	, title     =? "Friends List"                                       --> MH.doCenterFloat
	
	-- Workspaces
        , className =? "Chromium"                                           --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 0))
        , className =? "Firefox"                                            --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 0))
        , className =? "Code"                                               --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 1))
        , className =? "discord"                                            --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 2))
        , appName   =? myMusicPlayerClass                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 3))
	, className =? "Steam"                                              --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 5))
        , title     =? "Steam"                                              --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 5))
        , className =? "KeePassXC"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 7))
	
	-- Games
        , className MH.$? ".x86_64"                                         --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className MH.$? "steam_app_"                                      --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "csgo_linux64"                                       --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "dotnet"                                             --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "hl2_linux"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "robloxplayerbeta.exe"                               --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "mb_warband_linux"                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "factorio"                                           --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "bms_linux"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , appName   =? "Binding of Isaac: Rebirth"                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "ULTRAKILL"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "LibraryOfRuina"                                     --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "Lobotomy"                                           --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
	
	-- Ignore ( Do not manage ) & Lower / Raise
        , className MH.$? "eww-dashboard-"                                  --> doIgnore <> MH.doRaise
        , className =? "stalonetray"                                        --> doIgnore
        , className =? "trayer"                                             --> doIgnore
        , className =? "eww-notif-main"                                     --> doIgnore <> MH.doLower
        , resource  =? "desktop_window"                                     --> doIgnore
        , resource  =? "kdesktop"                                           --> doIgnore
        ]
