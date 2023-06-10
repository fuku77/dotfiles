-- https://github.com/fuku77/
module Binds.Key 
    ( myKeys
    , showKeybindings) where

import XMonad
import System.IO
import System.Exit

import Control.Lens
import Data.Maybe

import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Actions.WindowGo
import XMonad.Actions.WithAll

import XMonad.Layout.ResizableTile

import qualified XMonad.Hooks.ManageHelpers as MH
import XMonad.Hooks.ManageDocks

import XMonad.Util.NamedActions
import XMonad.Util.Run
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W

import User.Settings

myKeys :: XConfig l0 -> [((KeyMask, KeySym), NamedAction)]
myKeys c =
    -- Refrain from using an odd number of letters in the subtitles as it will cause the borders to be off

    let subKeys str ks = subtitle' str : mkNamedKeymap c ks in
    let keys = mkNamedKeymap c in -- No subtitle
    let color color str = "<span color=\""++color++"\">"++str++"</span>" in
    
    subKeys "XMonad Essentials "
    [ ("M-S-q"                      , addName " Exit xmonad"                                            $ io exitSuccess)
    , ("M-S-c"                      , addName " Kill focused window"                                      kill)
    , ("M-<Return>"                 , addName "  Launch terminal"                                       $ spawn myTerminal)
    , ("M-S-r"                      , addName " Restart xmonad"                                         $ spawn "xmonad --recompile; ~/.config/xmonad/scripts/onRestart; xmonad --restart;") ]

    ^++^
    subKeys "Application Shortcuts "
    [ ("M-a a"                      , addName " Launch floating terminal"                               $ spawnAndDo MH.doCenterFloat myTerminal)
    , ("M-e"                        , addName "   Launch file browser"                                  $ spawnHere myFileBrowser)

    , ("M-a s"                      , addName " Run or raise music player"                              $ raiseMaybe (spawn myMusicPlayer) (className =? myMusicPlayerClass))
    , ("M-a d"                      , addName " Run or raise browser"                                   $ raiseMaybe (spawn myBrowser) (className =? myBrowserClass)) ]

    -- "xs ^? element Int" is just "xs !! Int" but safe
    -- fromMaybe used to turn it into String
    ^++^
    subKeys "Switch to workspace "
    [ ("M-1"                        , addName "     Switch to workspace 1"                              $ windows $ W.greedyView $ head themeWorkspaces)
    , ("M-2"                        , addName "     Switch to workspace 2"                              $ windows $ W.greedyView $ fromMaybe "" (themeWorkspaces ^? element 1))
    , ("M-3"                        , addName "     Switch to workspace 3"                              $ windows $ W.greedyView $ fromMaybe "" (themeWorkspaces ^? element 2))
    , ("M-4"                        , addName "     Switch to workspace 4"                              $ windows $ W.greedyView $ fromMaybe "" (themeWorkspaces ^? element 3))
    , ("M-5"                        , addName "     Switch to workspace 5"                              $ windows $ W.greedyView $ fromMaybe "" (themeWorkspaces ^? element 4))
    , ("M-6"                        , addName "     Switch to workspace 6"                              $ windows $ W.greedyView $ fromMaybe "" (themeWorkspaces ^? element 5))
    , ("M-7"                        , addName "     Switch to workspace 7"                              $ windows $ W.greedyView $ fromMaybe "" (themeWorkspaces ^? element 6))
    , ("M-8"                        , addName "     Switch to workspace 8"                              $ windows $ W.greedyView $ fromMaybe "" (themeWorkspaces ^? element 7))
    , ("M-9"                        , addName "     Switch to workspace 9"                              $ windows $ W.greedyView $ last themeWorkspaces)
    , ("M-<L>"                      , addName "  Switch to previous workspace"                            prevWS)
    , ("M-<R>"                      , addName " Switch to next workspace"                                 nextWS) ]

    ^++^
    subKeys "Send to workspace "
    [ ("M-C-1"                      , addName "     Send to workspace 1"                                $ windows $ W.shift $ head themeWorkspaces)
    , ("M-C-2"                      , addName "     Send to workspace 2"                                $ windows $ W.shift $ fromMaybe "" (themeWorkspaces ^? element 1))
    , ("M-C-3"                      , addName "     Send to workspace 3"                                $ windows $ W.shift $ fromMaybe "" (themeWorkspaces ^? element 2))
    , ("M-C-4"                      , addName "     Send to workspace 4"                                $ windows $ W.shift $ fromMaybe "" (themeWorkspaces ^? element 3))
    , ("M-C-5"                      , addName "     Send to workspace 5"                                $ windows $ W.shift $ fromMaybe "" (themeWorkspaces ^? element 4))
    , ("M-C-6"                      , addName "     Send to workspace 6"                                $ windows $ W.shift $ fromMaybe "" (themeWorkspaces ^? element 5))
    , ("M-C-7"                      , addName "     Send to workspace 7"                                $ windows $ W.shift $ fromMaybe "" (themeWorkspaces ^? element 6))
    , ("M-C-8"                      , addName "     Send to workspace 8"                                $ windows $ W.shift $ fromMaybe "" (themeWorkspaces ^? element 7))
    , ("M-C-9"                      , addName "     Send to workspace 9"                                $ windows $ W.shift $ last themeWorkspaces)
    , ("M-C-<L>"                    , addName "  Send to previous workspace"                              shiftToPrev)
    , ("M-C-<R>"                    , addName " Send to next workspace"                                   shiftToNext) ]
    
    ^++^
    subKeys "Send to workspace and switch"
    [ ("M-S-1"                      , addName "     Send to workspace 1 and switch"                     $ windows (W.shift (head themeWorkspaces)) >> windows (W.greedyView (head themeWorkspaces)))
    , ("M-S-2"                      , addName "     Send to workspace 2 and switch"                     $ windows (W.shift (fromMaybe "" (themeWorkspaces ^? element 1))) >> windows (W.greedyView (fromMaybe "" (themeWorkspaces ^? element 1))))
    , ("M-S-3"                      , addName "     Send to workspace 3 and switch"                     $ windows (W.shift (fromMaybe "" (themeWorkspaces ^? element 2))) >> windows (W.greedyView (fromMaybe "" (themeWorkspaces ^? element 2))))
    , ("M-S-4"                      , addName "     Send to workspace 4 and switch"                     $ windows (W.shift (fromMaybe "" (themeWorkspaces ^? element 3))) >> windows (W.greedyView (fromMaybe "" (themeWorkspaces ^? element 3))))
    , ("M-S-5"                      , addName "     Send to workspace 5 and switch"                     $ windows (W.shift (fromMaybe "" (themeWorkspaces ^? element 4))) >> windows (W.greedyView (fromMaybe "" (themeWorkspaces ^? element 4))))
    , ("M-S-6"                      , addName "     Send to workspace 6 and switch"                     $ windows (W.shift (fromMaybe "" (themeWorkspaces ^? element 5))) >> windows (W.greedyView (fromMaybe "" (themeWorkspaces ^? element 5))))
    , ("M-S-7"                      , addName "     Send to workspace 7 and switch"                     $ windows (W.shift (fromMaybe "" (themeWorkspaces ^? element 6))) >> windows (W.greedyView (fromMaybe "" (themeWorkspaces ^? element 6))))
    , ("M-S-8"                      , addName "     Send to workspace 8 and switch"                     $ windows (W.shift (fromMaybe "" (themeWorkspaces ^? element 7))) >> windows (W.greedyView (fromMaybe "" (themeWorkspaces ^? element 7))))
    , ("M-S-9"                      , addName "     Send to workspace 9 and switch"                     $ windows (W.shift (last themeWorkspaces)) >> windows (W.greedyView (last themeWorkspaces)))
    , ("M-S-<L>"                    , addName "  Send to previous workspace and switch"                 $ shiftToPrev >> prevWS)
    , ("M-S-<R>"                    , addName " Send to next workspace and switch"                      $ shiftToNext >> nextWS)]
    
    ^++^
    subKeys "Menu Shortcuts"
    [ ("M-r"                        , addName "     App launcher"                                   $ spawn " rofi -show drun")
    , ("M-S-m c"                    , addName " Calculator"                                             $ spawn " rofi -show calc") -- https://github.com/svenstaro/rofi-calc
    , ("M-S-m e"                    , addName " Emoji picker"                                           $ spawn " rofi -show emoji")] -- https://github.com/Mange/rofi-emoji

    ^++^
    subKeys "Window Navigation "
    [ ("M-<Tab>"                    , addName "       Cycle window focus"                               $ windows W.focusDown)
    , ("M-j"                        , addName "         Focus previous"                                 $ windows W.focusDown)
    , ("M-k"                        , addName "         Focus next"                                     $ windows W.focusUp)
    , ("M-m"                        , addName "         Focus master"                                   $ windows W.focusMaster)
    , ("M-<Backspace>"              , addName " Swap focused window with master"                        $ windows W.swapMaster)
    , ("M-S-j"                      , addName "   Swap focused window with previous window"             $ windows W.swapDown)
    , ("M-S-k"                      , addName "   Swap focused window with next window"                 $ windows W.swapUp) ]

    ^++^
    subKeys "Layout Controls "
    [ ("M-<Space>"                  , addName "   Next layout"                                          $ sendMessage NextLayout)
    , ("M-h"                        , addName "       Shrink master window horizontally"                $ sendMessage Shrink)
    , ("M-l"                        , addName "       Expand master window horizontally"                $ sendMessage Expand)
    , ("M-S-h"                      , addName " Shrink master window vertically"                        $ sendMessage MirrorShrink)
    , ("M-S-l"                      , addName " Expand master window vertically"                        $ sendMessage MirrorExpand)
    , ("M-t"                        , addName "       Sink focused window"                              $ withFocused $ windows . W.sink)
    , ("M-S-t"                      , addName " Sink all windows"                                         sinkAll)
    , ("M-,"                        , addName "   Increase master windows"                              $ sendMessage (IncMasterN 1))
    , ("M-."                        , addName "  Decrease master windows"                               $ sendMessage (IncMasterN (-1)))
    , ("M-b"                        , addName "       Toggle status bar"                                $ 
        do
            spawn "$HOME/.scripts/toggle-xmobar"
            sendMessage $ ToggleStrut U) ]

    ^++^
    subKeys "Media Keys"
    [ ("M-;"                        , addName "        Toggle playing track"                            $ spawn "$HOME/.scripts/media-control.sh playerctl toggle")
    , ("M-\\"                       , addName "        Next track"                                      $ spawn "$HOME/.scripts/media-control.sh playerctl next")
    , ("M-\'"                       , addName "       Previous track"                                   $ spawn "$HOME/.scripts/media-control.sh playerctl prev")
    , ("M-S-\\"                     , addName "  Seek forward by 5s"                                    $ spawn "$HOME/.scripts/media-control.sh playerctl pos + 5")
    , ("M-S-\'"                     , addName " Rewind by 5s"                                           $ spawn "$HOME/.scripts/media-control.sh playerctl pos - 5")
    , ("M-p"                        , addName "                Toggle mute"                             $ spawn "$HOME/.scripts/volume-control.sh toggle-mute")
    , ("M-["                        , addName "      Lower volume by 5%"                                $ spawn "$HOME/.scripts/volume-control.sh decr 5")
    , ("M-]"                        , addName "     Raise volume by 5%"                                 $ spawn "$HOME/.scripts/volume-control.sh incr 5") ]

    ^++^
    subKeys "MPD Control "
    [ ("M-s z"                      , addName " Toggle random mode"                                     $ spawn "$HOME/.scripts/media-control.sh mpc random")
    , ("M-s r"                      , addName " Toggle repeat mode"                                     $ spawn "$HOME/.scripts/media-control.sh mpc repeat")
    , ("M-s S-r"                    , addName " Toggle consume mode"                                    $ spawn "$HOME/.scripts/media-control.sh mpc consume")
    , ("M-s y"                      , addName " Toggle single mode"                                     $ spawn "$HOME/.scripts/media-control.sh mpc single")
    , ("M-s ;"                      , addName " Toggle pause"                                           $ spawn "$HOME/.scripts/media-control.sh mpc toggle")
    , ("M-s \\"                     , addName " Next track"                                             $ spawn "$HOME/.scripts/media-control.sh mpc next")
    , ("M-s \'"                     , addName " Previous track"                                         $ spawn "$HOME/.scripts/media-control.sh mpc prev")
    , ("M-S-s \\"                   , addName " Seek forward by 5s"                                     $ spawn "$HOME/.scripts/media-control.sh mpc pos + 5")
    , ("M-S-s \'"                   , addName " Rewind by 5s"                                           $ spawn "$HOME/.scripts/media-control.sh mpc pos - 5")
    , ("M-s s"                      , addName " Stop"                                                   $ spawn "$HOME/.scripts/media-control.sh mpc stop")
    , ("M-s i"                      , addName " Get info"                                               $ spawn "$HOME/.scripts/media-control.sh mpc getinfo")]

    ^++^
    subKeys "Multimedia Keys "
    [ ("<XF86AudioPlay>"            , addName "        Toggle playing track"                            $ spawn "$HOME/.scripts/media-control.sh toggle")
    , ("<XF86AudioRaiseVolume>"     , addName " Raise volume by 5%"                                     $ spawn "$HOME/.scripts/volume-control.sh incr 5")
    , ("<XF86AudioLowerVolume>"     , addName " Lower volume by 5%"                                     $ spawn "$HOME/.scripts/volume-control.sh decr 5")
    , ("<XF86AudioMute>"            , addName "        Toggle mute"                                     $ spawn "$HOME/.scripts/volume-control.sh toggle-mute") ]

    ^++^
    subKeys "Screenshot"
    [ ("<Print>"                    , addName "       Full screenshot"                                  $ spawn "~/.scripts/screenshot.sh full")
    , ("S-<Print>"                  , addName " Screenshot area"                                        $ spawn "~/.scripts/screenshot.sh area") ]
    ^++^
    subKeys "Theme Specific" themeKeybindings

padLeft :: String
padLeft = "      "

-- Titles the keys, used by subKeys
-- This adds a invisible unusable keybinding with x as the description (along with some decoration)
subtitle' :: String -> ((KeyMask, KeySym), NamedAction)
subtitle' x =
    ( (0, 0),
      NamedAction $
      --sep "╔" "╗" '═' ++ "\n║" ++ spacing ++ x ++ spacing ++ "║\n" ++ sep "╚" "╝" '═'
      sep "┏" "┓" '━' ++ "\n" ++ padLeft ++ "┃" ++ spacing ++ x ++ spacing ++ "┃\n" ++ padLeft ++ sep "┗" "┛" '━'
    )
    where
        spacing = replicate ((length (sep "" "" ' ') - length x) `div` 2) ' '
        -- Increase the integer to make the subtitles wider. 
        -- The number needs to be even (tried rounding but whatever)
        -- And it needs to be large enough so that its longer than any subtitle
        sep a b c = a ++ replicate ((64 - length x) + length x) c ++ b

-- Show keybindings using yad
-- Adding a name to this causes it to not show up as a keybing, and only show its name (for some reason)
-- And since it is at the very top of the help text i use it for decorative purposes
showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
showKeybindings x = addName                    (unlines $ map (\x -> padLeft ++ x) [
      "<span bgcolor=\""++color09++"\"> \n\n\n"
    , "                                                                    "
    , "                   \\/  |\\/|  / ‾ \\  |\\|   /\\   | ‾ \\          "
    , "                   /\\  |  |  \\_/  | \ \|  /--\\  |_/              \n"
    , "                          <span color=\""++color09++"\">°:.</span>"
    ++" <span color=\""++color10++"\">°:.</span>"
    ++" <span color=\""++color11++"\">°:.</span>"
    ++" <span color=\""++color12++"\">°:.</span>"
    , "                            <span color=\""++color13++"\">°:.</span>"
    ++" <span color=\""++color14++"\">°:.</span>"
    ++" <span color=\""++color15++"\">°:.</span>"
    , "</span>\n\n"
    ])
    $ io $ do
        h <- spawnPipe ("xdotool search --name 'XMonad Keybindings' windowkill ||"
            ++" yad"
            ++" --title 'XMonad Keybindings'"
            ++" --fore="++colorFore
            ++" --back="++colorBack
            ++" --fontname='Fira Mono Bold 12'"
            ++" --borders 0"
            ++" --margin 50"
            ++" --geometry 800x600+660+90"
            ++" --on-top"
            ++" --formatted"
            ++" --undecorated"
            ++" --sticky"
            ++" --text-info"
	    ++" --no-escape"
            ++" --no-buttons")
        
        hPutStr h (unlines $ map (\x -> padLeft ++ x) (showKmSimple x))
        hClose h
        return ()
