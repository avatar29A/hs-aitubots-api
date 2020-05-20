{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ForwardMessage (ForwardMessage (..)) where

import Data.Aeson
import Data.Text
import Data.Maybe
import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)

-- 
-- doc: https://btsdigital.github.io/bot-api-contract/ForwardMessage.html 
data ForwardMessage = ForwardMessage {
    forwardMessageType                      :: Text
    , forwardMessageLocalId                 :: Maybe UUID
    , forwardMessageFromDialog              :: Peer
    , forwardMessageToDialog                :: Peer
    , forwardMessageId                      :: UUID
} deriving (Show)

instance ToJSON ForwardMessage where
    toJSON command = object [
        "type"              .= forwardMessageType command
        , "localId"         .= forwardMessageLocalId command
        , "fromDialog"      .= forwardMessageFromDialog command
        , "toDialog"        .= forwardMessageToDialog command
        , "messageId"       .= forwardMessageId command]

instance FromJSON ForwardMessage where
    parseJSON (Object o) = ForwardMessage <$> o .: "type"
                                                    <*> o .:? "localId"
                                                    <*> o .: "fromDialog"
                                                    <*> o .: "toDialog"
                                                    <*> o .: "messageId"