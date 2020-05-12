{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.SendMessageCommand where

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
    csmType :: CommandType
    , csmLocalId :: Maybe Text
    , csmContent :: Text
    , csmRecipient :: Peer
    , csmReplyToMessageId :: Maybe UUID
    , csmInlineCommands :: Maybe [InlineCommand]
    , csmInlineCommandRows :: Maybe [RowInlineCommands]
    , csmUIState :: Maybe UIState
    , csmMediaList :: Maybe [InputMedia]
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
