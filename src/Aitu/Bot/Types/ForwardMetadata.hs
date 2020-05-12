{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.ForwardMetadata where

import Data.Aeson
import Data.Text

import Aitu.Bot.Types.Peer (Peer)

-- ForwardMetadata stores info about original author
-- doc: https://btsdigital.github.io/bot-api-contract/messageforwardmetadata.html
newtype ForwardMetadata = ForwardMetadata {
    fmSender :: Peer
}

instance FromJSON ForwardMetadata where
    parseJSON (Object v) =
        ForwardMetadata <$> v .: "sender"