{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.SendMessage
    ( SendMessage(..)
    , mkSendMessageWithDefaults
    )
where

import           Data.Aeson
import           Data.Maybe
import qualified Data.Aeson.Types              as JSONTypes
import           Data.Text
import           Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8    as BC

import           Aitu.Bot.Types.Peer            ( Peer )
import           Aitu.Bot.Types.UIState         ( UIState )
import           Aitu.Bot.Types.InputMedia      ( InputMedia )
import           Aitu.Bot.Types.InlineCommand   ( InlineCommand
                                                , RowInlineCommands
                                                )

-- SendMessageCommand sends messages from service (bot) to a dialog with a user, group dialog or a channel.
-- doc: https://btsdigital.github.io/bot-api-contract/SendMessage.html
data SendMessage = SendMessage {
    localId                         :: Maybe Text
    , content                     :: Text
    , recipient                   :: Peer
    , replyToMessageId            :: Maybe UUID
    , inlineCommandRows           :: Maybe [RowInlineCommands]
    , uiState                     :: Maybe UIState
    , mediaList                   :: Maybe [InputMedia]
} deriving (Show)

mkSendMessageWithDefaults :: Text -> Peer -> SendMessage
mkSendMessageWithDefaults content peer = SendMessage
    { localId           = Nothing
    , content           = content
    , recipient         = peer
    , replyToMessageId  = Nothing
    , inlineCommandRows = Nothing
    , uiState           = Nothing
    , mediaList         = Nothing
    }

instance ToJSON SendMessage where
    toJSON SendMessage {..} = object
        [ "type" .= ("SendMessage" :: Text)
        , "localId" .= localId
        , "content" .= content
        , "recipient" .= recipient
        , "replyToMessageId" .= replyToMessageId
        , "inlineCommandRows" .= maybeToList inlineCommandRows
        , "uiState" .= uiState
        , "mediaList" .= maybeToList mediaList
        ]
