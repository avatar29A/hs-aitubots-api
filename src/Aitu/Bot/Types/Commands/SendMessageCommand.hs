{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.SendMessageCommand (
    SendMessageCommand
    , RowInlineCommands) 
where

import Data.Aeson
import qualified Data.Aeson.Types as JSONTypes
import Data.Text
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as BC   

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.UIState (UIState)
import Aitu.Bot.Types.InputMedia (InputMedia)

import Aitu.Bot.Types.Commands.InlineCommand (InlineCommand)

type CommandType = String
type RowInlineCommands = [InlineCommand]

data SendMessageCommand = SendMessageCommand {
    smType :: CommandType
    , smLocalId :: Maybe Text
    , smContent :: Text
    , smRecipient :: Peer
    , smReplyToMessageId :: Maybe UUID
    , smInlineCommands :: Maybe [InlineCommand]
    , smInlineCommandRows :: Maybe [RowInlineCommands]
    , smUIState :: Maybe UIState
    , smMediaList :: Maybe [InputMedia]
} deriving (Show)

instance FromJSON SendMessageCommand where
    parseJSON (Object v) =
        SendMessageCommand <$> v .: "type"
                            <*> v .:? "localId"
                            <*> v .: "content"
                            <*> v .: "recipient"
                            <*> v .: "replyToMessageId"
                            <*> v .:? "inlineCommands"
                            <*> v .:? "inlineCommandRows"
                            <*> v .:? "uiState"
                            <*> v .:? "mediaList"
