-- https://github.com/fuku77
module Binds.Mouse where

import Data.Ratio

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.FloatSnap
import XMonad.Actions.FlexibleResize as Flex
import XMonad.Actions.TiledWindowDragging

import XMonad.Hooks.FadeWindows ( isFloating )

import XMonad.Util.Run

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myMouseBindings (XConfig {XMonad.modMask = myModMask}) = M.fromList
    -- Move the window
    [ ((myModMask, button1), \w -> focus w >> mouseMoveWindow w >> afterDrag (snapMagicMove (Just 10) (Just 10) w))

    -- Drag the window in tiled mode
    , ((myModMask .|. shiftMask, button1), dragWindow)

    -- Promote window as a master
    , ((myModMask, button2), \w -> focus w >> windows W.shiftMaster)

    -- Resize the window
    , ((myModMask, button3), \w -> focus w >> Flex.mouseResizeEdgeWindow (3 % 4) w >> afterDrag (snapMagicResize [L,R,U,D] (Just 10) (Just 10) w))
    
    -- Navigate workspaces using scroll (if mouse is on empty space)
    --, ((0, button5), const $ spawn "xdotool click 5; [ $(xqp) = 0x00000000 ] && xdotool key Super_L+Left")
    --, ((0, button4), const $ spawn "xdotool click 4; [ $(xqp) = 0x00000000 ] && xdotool key Super_L+Right")

    -- Navigate workspaces using mod + Scroll
    , ((myModMask, button5), const prevWS)
    , ((myModMask, button4), const nextWS)
    ]
