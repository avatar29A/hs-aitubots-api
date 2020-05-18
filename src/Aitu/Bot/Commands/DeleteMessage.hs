{-# LANGUAGE OverloadedStrings #-}
module Aitu.Bot.Commands.DeleteMessage (DeleteMessage (..)) where

import Data.Aeson
import Data.Text
import Data.Maybe
import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)

-- 
-- doc: https://btsdigital.github.io/bot-api-contract/DeleteMessage.html
data DeleteMessage = DeleteMessage {
    deleteMessageType               :: Text
    , deleteMessageId               :: UUID
    , deleteMessageDialog           :: Peer
}

instance ToJSON DeleteMessage where
    toJSON command = object [
        "type"              .= deleteMessageType command
        , "messageId"       .= deleteMessageId command
        , "dialog"          .= deleteMessageDialog command]

instance FromJSON DeleteMessage where
    parseJSON (Object o) = DeleteMessage <$> o .: "type"
                                            <*> o .: "messageId"
                                            <*> o .: "dialog"
