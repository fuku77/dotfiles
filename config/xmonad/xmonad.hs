-- https://github.com/fuku77/
module Main where

import Graphics.X11.Types
import XMonad

import XMonad.Layout.Fullscreen ( fullscreenSupport, fullscreenFull )
import XMonad.Layout.NoBorders ( smartBorders )

import XMonad.Hooks.ManageDocks ( docks, avoidStruts )
import XMonad.Hooks.StatusBar
import XMonad.Hooks.EwmhDesktops

import XMonad.Util.NamedActions
import XMonad.Util.EZConfig

-- My Imports --
import Hooks.Event
import Hooks.Manage
import Hooks.Startup
import Hooks.Layout

import Binds.Key
import Binds.Mouse

import User.Settings

-- Main Setup --
--
-- No need to change anything here.
main :: IO ()
main = do
       xmonad
     $ fullscreenSupport
     $ ewmh
     $ ewmhFullscreen
     $ docks
     $ withSB themeSB
     $ addDescrKeys' ((myModMask, xK_F1), showKeybindings) myKeys
     $ def
         { terminal           = myTerminal
         , focusFollowsMouse  = myFocusFollowsMouse
         , clickJustFocuses   = myClickJustFocuses
         , borderWidth        = themeBorderWidth
         , modMask            = myModMask
         , workspaces         = themeWorkspaces
         , normalBorderColor  = themeNormalBorderColor
         , focusedBorderColor = themeFocusedBorderColor

         , mouseBindings      = myMouseBindings

         , layoutHook         = myLayoutHook
         , manageHook         = myManageHook
         , handleEventHook    = myEventHook
         , startupHook        = myStartupHook }
