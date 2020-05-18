
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.EditContainerMessage (EditContainerMessage (..)) where

import Data.Aeson
import Data.Text
import Data.Maybe

import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.UIState (UIState)
import Aitu.Bot.Types.InputMedia (InputMedia)
import Aitu.Bot.Types.InlineCommand (InlineCommand, RowInlineCommands)

-- doc: https://btsdigital.github.io/bot-api-contract/EditContainerMessage.html
data EditContainerMessage = EditContainerMessage {
    editContainerMessageType              :: Text
    , editContainerMessageRecipient       :: Peer
    , editContainerMessageContent         :: Text
}

instance ToJSON EditContainerMessage where
    toJSON command = object [
        "type"                  .= editContainerMessageType command
        , "recipient"           .= editContainerMessageRecipient command
        , "content"             .= editContainerMessageContent command]

instance FromJSON EditContainerMessage where
    parseJSON (Object o) =
        EditContainerMessage <$> o .: "type"
                            <*> o   .: "recipient"
                            <*> o   .: "content"