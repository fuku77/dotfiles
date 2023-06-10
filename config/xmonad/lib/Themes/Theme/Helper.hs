-- https://github.com/fuku77
module Themes.Theme.Helper 
    ( replace
    , escapeQuotes
    , getBarPos ) where

import Data.List ( stripPrefix )
import XMonad.Util.Types


-- Thanks https://hackage.haskell.org/package/extra-1.7.10/docs/Data-List-Extra.html#v:replace
replace :: (Eq a) => [a] -> [a] -> [a] -> [a]
replace [] _ _ = error "replace: first argument cannot be empty"
replace from to xs | Just xs <- stripPrefix from xs = to ++ replace from to xs
replace from to (x:xs) = x : replace from to xs
replace from to [] = []

-- -- This is used to escape the quotes used in Xmobar commands/plugins/etc.

-- -- A valid xmobar command:

-- With escapeQuotes:
-- myComC = "Run Com \"bash\" [ \"-c\", \"echo \\\"this is a string in double quotes!\\\" \" ] \"n\" 10"

-- Without escapeQuotes:

-- myComC = "Run Com \\\"bash\\\" [ \\\"-c", \\\"echo \\\\\\\"this is a string in double quotes!\\\\\\\"\\\"] \\\"n\\\" 10"

escapeQuotes :: String -> String
escapeQuotes x = replace "\"" "\\\"" $ replace "\\\"" "\\\\\"" x


getBarPos :: Direction2D -> (String, String) -> String
getBarPos U (d, u) = u
getBarPos D (d, u) = d
getBarPos _ (d, u) = u
