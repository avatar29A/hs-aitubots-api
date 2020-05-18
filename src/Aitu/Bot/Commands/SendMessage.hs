{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.SendMessage (
    SendMessage (..)
    , RowInlineCommands 
    , mkSendMessageWithDefaults)
where

import Data.Aeson
import Data.Maybe
import qualified Data.Aeson.Types as JSONTypes
import Data.Text
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as BC   

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.UIState (UIState)
import Aitu.Bot.Types.InputMedia (InputMedia)
import Aitu.Bot.Types.InlineCommand (InlineCommand, RowInlineCommands)

-- SendMessageCommand sends messages from service (bot) to a dialog with a user, group dialog or a channel.
-- doc: https://btsdigital.github.io/bot-api-contract/SendMessage.html
data SendMessage = SendMessage {
    smType                          :: Text
    , smLocalId                     :: Maybe Text
    , smContent                     :: Text
    , smRecipient                   :: Peer
    , smReplyToMessageId            :: Maybe UUID
    , smInlineCommandRows           :: Maybe [RowInlineCommands]
    , smUIState                     :: Maybe UIState
    , smMediaList                   :: Maybe [InputMedia]
} deriving (Show)

mkSendMessageWithDefaults :: Text -> Peer -> SendMessage
mkSendMessageWithDefaults content peer = SendMessage {
    smType                  = "SendMessage"
    , smLocalId             = Nothing
    , smContent             = content
    , smRecipient           = peer
    , smReplyToMessageId    = Nothing
    , smInlineCommandRows   = Nothing
    , smUIState             = Nothing
    , smMediaList           = Nothing
}

instance ToJSON SendMessage where
    toJSON command = object [
        "type"                  .= smType command
        , "localId"             .= smLocalId command
        , "content"             .= smContent command
        , "recipient"           .= smRecipient command
        , "replyToMessageId"    .= smReplyToMessageId command
        , "inlineCommandRows"   .= maybeToList (smInlineCommandRows command)
        , "uiState"             .= smUIState command
        , "mediaList"           .= maybeToList (smMediaList command)]

instance FromJSON SendMessage where
    parseJSON (Object v) =
        SendMessage <$> v .: "type"
                            <*> v .:? "localId"
                            <*> v .: "content"
                            <*> v .: "recipient"
                            <*> v .:? "replyToMessageId"
                            <*> v .:? "inlineCommandRows"
                            <*> v .:? "uiState"
                            <*> v .:? "mediaList"
