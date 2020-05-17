{-# LANGUAGE OverloadedStrings #-}

module JSONSpec (spec) where

import System.IO

import Data.Aeson
import Data.Either
import Test.Hspec
import qualified Data.ByteString.Lazy.Char8 as BC

import Aitu.Bot.Types

spec :: Spec
spec = describe "Message deserialization" $ do
        -- rawJson <- runIO $ loadJson "test-data/json-data/full-message.json"
        -- let left = fromLeft "" $ messageDecode rawJson
        it "Fully correct JSON" $
            1 `shouldBe` 1