{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands where

import Data.Aeson
import qualified Data.Aeson.Types as JSONTypes
import Data.Text
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as BC   

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.Message (Media)

type CommandType = String

data InlineCommand = InlineCommand {
    icCaption :: Text
    , icMetadata :: Text
}

instance FromJSON InlineCommand where
    parseJSON (Object v) =
        InlineCommand <$> v .: "caption"
                        <*> v .: "metadata"

data CommandSendMessage = CommandSendMessage {
    csmType :: CommandType
    , csmLocalId :: Text
    , csmRecipient :: Peer
    , csmReplyToMessageId :: Maybe UUID
    , csmContent :: Text
    , csmInlineCommandRows :: [[InlineCommand]]
}

instance FromJSON CommandSendMessage where
    parseJSON (Object v) =
        CommandSendMessage <$> v .: "type"
                            <*> v .: "localId"
                            <*> v .: "recipient"
                            <*> v .: "replyToMessageId"
                            <*> v .: "content"
                            <*> v .: "inlineCommandRows"
