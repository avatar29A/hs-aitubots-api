module Main (main) where

import Test.Hspec
import qualified JSONSpec

main :: IO ()
main = hspec JSONSpec.spec
