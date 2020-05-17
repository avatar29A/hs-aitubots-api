{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.SendMessageCommand (
    SendMessageCommand (..)
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

import Aitu.Bot.Types.Commands.InlineCommand (InlineCommand)

type RowInlineCommands = [InlineCommand]

data SendMessageCommand = SendMessageCommand {
    smType :: Text
    , smLocalId :: Maybe Text
    , smContent :: Text
    , smRecipient :: Peer
    , smReplyToMessageId :: Maybe UUID
    , smInlineCommandRows :: Maybe [RowInlineCommands]
    , smUIState :: Maybe UIState
    , smMediaList :: Maybe [InputMedia]
} deriving (Show)

mkSendMessageWithDefaults :: Text -> Peer -> SendMessageCommand
mkSendMessageWithDefaults content peer = SendMessageCommand {
    smType                  = "SendMessage"
    , smLocalId             = Nothing
    , smContent             = content
    , smRecipient           = peer
    , smReplyToMessageId    = Nothing
    , smInlineCommandRows   = Nothing
    , smUIState             = Nothing
    , smMediaList           = Nothing
}

instance ToJSON SendMessageCommand where
    toJSON command = object [
        "type"                  .= smType command
        , "localId"             .= smLocalId command
        , "content"             .= smContent command
        , "recipient"           .= smRecipient command
        , "replyToMessageId"    .= smReplyToMessageId command
        , "inlineCommandRows"   .= maybeToList (smInlineCommandRows command)
        , "uiState"             .= smUIState command
        , "mediaList"           .= maybeToList (smMediaList command)]

instance FromJSON SendMessageCommand where
    parseJSON (Object v) =
        SendMessageCommand <$> v .: "type"
                            <*> v .:? "localId"
                            <*> v .: "content"
                            <*> v .: "recipient"
                            <*> v .:? "replyToMessageId"
                            <*> v .:? "inlineCommandRows"
                            <*> v .:? "uiState"
                            <*> v .:? "mediaList"
