{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Bot where

import Data.Aeson
import Data.Text
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as BC

data Bot = Bot {botId :: UUID
                , botName :: Text
                , botUserName :: Text} deriving (Show)

instance FromJSON Bot where
    parseJSON (Object v) =
        Bot <$> v .: "botId"
            <*> v .: "name"
            <*> v .: "username"