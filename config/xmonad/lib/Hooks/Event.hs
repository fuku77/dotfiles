-- https://github.com/fuku77/
module Hooks.Event where

import XMonad.Util.NamedWindows (getName)

import qualified XMonad.StackSet as W

import Data.Monoid
import Data.List (sortBy)
import Data.Function (on)
import Control.Monad (forM_, join)

import XMonad

-- See https://github.com/stites/configs-mirror/blob/master/programs/xmonad/xmonad-with-polybar.hs

myEventHook :: Event -> X All
myEventHook = mempty
