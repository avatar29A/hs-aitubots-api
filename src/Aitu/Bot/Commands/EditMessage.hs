{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.EditMessage (EditMessage (..)) where

import Data.Aeson
import Data.Text
import Data.Maybe

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.UIState (UIState)
import Aitu.Bot.Types.InputMedia (InputMedia)
import Aitu.Bot.Types.InlineCommand (InlineCommand, RowInlineCommands)

-- EditMessageCommand sends message about a message editing
-- docs: https://btsdigital.github.io/bot-api-contract/EditMessage.html
data EditMessage = EditMessage {
    editMessageType                             :: Text
    , editMessageId                             :: Text
    , editMessageRecipient                      :: Peer
    , editMessageContent                        :: Text
    , editMessageInlineCommandRows              :: Maybe [RowInlineCommands]
    , editMessageUIState                        :: Maybe UIState
    , editMessageMediaList                      :: Maybe [InputMedia]} deriving (Show)

instance ToJSON EditMessage where
    toJSON command = object [
        "type"                  .= editMessageType command
        , "messageId"           .= editMessageId command
        , "recipient"           .= editMessageRecipient command
        , "content"             .= editMessageContent command
        , "inlineCommandRows"   .= maybeToList (editMessageInlineCommandRows command)
        , "uiState"             .= editMessageUIState command
        , "mediaList"           .= maybeToList (editMessageMediaList command)]

instance FromJSON EditMessage where
    parseJSON (Object o) =
        EditMessage <$> o .: "type"
                            <*> o .: "messageId"
                            <*> o .: "recipient"
                            <*> o .: "content"
                            <*> o .:? "inlineCommandRows"
                            <*> o .:? "uiState"
                            <*> o .:? "mediaList"