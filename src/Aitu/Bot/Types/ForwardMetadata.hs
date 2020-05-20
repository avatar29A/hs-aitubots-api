{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.ForwardMetadata (ForwardMetadata (..)) where

import Data.Aeson
import Data.Text

import Aitu.Bot.Types.Peer (Peer)

-- ForwardMetadata stores info about original author
-- doc: https://btsdigital.github.io/bot-api-contract/messageforwardmetadata.html
newtype ForwardMetadata = ForwardMetadata {
    forwardMetadataSender :: Peer
} deriving (Show)

instance FromJSON ForwardMetadata where
    parseJSON (Object v) =
        ForwardMetadata <$> v .: "sender"