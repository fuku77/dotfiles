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
        , className =? "Galculator"                                         --> MH.doCenterFloat
        , className =? "roblox_installer.exe"                               --> MH.doCenterFloat
        , className =? "Gcolor3"                                            --> MH.doCenterFloat
        , appName   =? "An Anime Game Launcher"                             --> MH.doCenterFloat
        , appName   =? "ncmpcpp"                                            --> MH.doCenterFloat <> MH.doFocus -- (RationalRect 0.275 0.3313 0.45 0.3375)
	, title     =? "XMonad Keybindings"                                 --> MH.doCenterFloat
	, title     =? "Friends List"                                       --> MH.doCenterFloat

	-- Custom Float
        , className =? "Thunar"                                             --> MH.doRectFloat (RationalRect 0.25 0.25 0.5 0.5)
	, className =? "password-prompt"                                    --> MH.doRectFloat (RationalRect 0.370 0.46875 0.25 0.0625)
	, className =? "pavucontrol-popup"                                  --> MH.doRectFloat (RationalRect 0.5625 0.054625 0.3 0.3)
        

	-- Workspaces: Web
        , className =? "Chromium"                                           --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 0))
        , className =? "Firefox"                                            --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 0))
        
        -- Workspaces: Coding
        , className =? "Code"                                               --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 1))
        , className =? "code - oss"                                         --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 1))
        , className =? "com-cburch-logisim-Main"                            --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 1))

        -- Workspaces: Messaging
        , className =? "discord"                                            --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 2))

        -- Workspaces: Music
        , appName   =? myMusicPlayerClass                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 3))

	-- Workspaces: Games
        , className MH.$? ".x86_64"                                         --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className MH.$? "steam_app_"                                      --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "csgo_linux64"                                       --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "cs2"                                                --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "dotnet"                                             --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "hl2_linux"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "robloxplayerbeta.exe"                               --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "mb_warband_linux"                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "factorio"                                           --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "bms_linux"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_881100"                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_1388770"                                  --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_411370"                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_303310"                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_1454400"                                  --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_2121980"                                  --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_2379780"                                  --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "steam_app_787480"                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "genshinimpact.exe"                                  --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "tsukihime.exe"                                      --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "Slay the Spire"                                     --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , className =? "darksoulsremastered.exe"                            --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , appName   =? "vampire_survivors"                                  --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , appName   =? "Binding of Isaac: Rebirth"                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
	, title     =? "VampireSurvivors"                                   --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
	, title     =? "Risk of Rain"                                       --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
	, title     =? "Risk of Rain 2"                                     --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "ULTRAKILL"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "Dead Estate"                                        --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "Lobotomy"                                           --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "LibraryOfRuina"                                     --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "LimbusCompany"                                      --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "Spelunky"                                           --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "Spelunky 2"                                         --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "TheSilverCase"                                      --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))
        , title     =? "Rain World"                                         --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 4))

        -- Workspaces: Steam
	, className =? "Steam"                                              --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 5))
	, className =? "steamwebhelper"                                     --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 5))
        , title     =? "Steam"                                              --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 5))

        -- Workspaces: Downloads
	, className =? "qBittorrent"                                        --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 5))

        -- Workspaces: Passwords
        , className =? "KeePassXC"                                          --> doShift (fromMaybe ( last themeWorkspaces ) (themeWorkspaces ^? element 7))
	
	
	-- Ignore ( Do not manage ) & Lower / Raise
        , className MH.$? "eww-dashboard-"                                  --> doIgnore <> MH.doRaise
        , className =? "stalonetray"                                        --> doIgnore
        , className =? "trayer"                                             --> doIgnore
        , className =? "eww-notif-main"                                     --> doIgnore <> MH.doLower
        , resource  =? "desktop_window"                                     --> doIgnore
        , resource  =? "kdesktop"                                           --> doIgnore
        ]
