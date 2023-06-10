-- https://github.com/fuku77/
module Hooks.Layout where

import XMonad

import XMonad.Hooks.ManageDocks

import XMonad.Layout.DraggingVisualizer
import XMonad.Layout.Fullscreen
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spiral

import User.Settings

tall     = renamed [Replace "tl"]
           $ fullscreenFull
           $ ResizableTall 1 (3/100) (1/2) []
spirals  = renamed [Replace "sp"]
           $ fullscreenFull
           $ spiral (6/7)
full     = renamed [Replace "fl"]
           $ fullscreenFull
           Full

myLayoutHook = lessBorders (Combine Difference Screen OnlyScreenFloat) 
    $ draggingVisualizer 
    $ smartBorders 
    $ avoidStruts
    $ themeSpacing 
    $ myLayout
    where
        myLayout = tall 
               ||| Mirror tall 
               ||| full 
               ||| spirals
