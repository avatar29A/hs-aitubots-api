
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.SendContainerMessage (SendContainerMessage (..)) where

import Data.Aeson
import Data.Text
import Data.Maybe

import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.UIState (UIState)
import Aitu.Bot.Types.InputMedia (InputMedia)
import Aitu.Bot.Types.InlineCommand (InlineCommand, RowInlineCommands)

-- doc: https://btsdigital.github.io/bot-api-contract/SendContainerMessage.html
data SendContainerMessage = SendContainerMessage {
    sendContainerMessageType              :: Text
    , sendContainerMessageLocalId         :: Maybe UUID
    , sendContainerMessageRecipient       :: Peer
    , sendContainerMessageContent         :: Text
} deriving (Show)

instance ToJSON SendContainerMessage where
    toJSON command = object [
        "type"                  .= sendContainerMessageType command
        , "localId"             .= sendContainerMessageLocalId command
        , "recipient"           .= sendContainerMessageRecipient command
        , "content"             .= sendContainerMessageContent command]

instance FromJSON SendContainerMessage where
    parseJSON (Object o) =
        SendContainerMessage <$> o .: "type"
                            <*> o   .:? "localId"
                            <*> o   .: "recipient"
                            <*> o   .: "content"