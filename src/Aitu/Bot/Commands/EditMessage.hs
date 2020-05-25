{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.EditMessage
    ( EditMessage(..)
    )
where

import           Data.Aeson
import           Data.Text
import           Data.Maybe

import           Aitu.Bot.Types.Peer            ( Peer )
import           Aitu.Bot.Types.UIState         ( UIState )
import           Aitu.Bot.Types.InputMedia      ( InputMedia )
import           Aitu.Bot.Types.InlineCommand   ( InlineCommand
                                                , RowInlineCommands
                                                )

-- EditMessageCommand sends message about a message editing
-- docs: https://btsdigital.github.io/bot-api-contract/EditMessage.html
data EditMessage = EditMessage {
    messageId                        :: Text
    , recipient                      :: Peer
    , content                        :: Text
    , inlineCommandRows              :: Maybe [RowInlineCommands]
    , uiState                        :: Maybe UIState
    , mediaList                      :: Maybe [InputMedia]} deriving (Show)

instance ToJSON EditMessage where
    toJSON EditMessage {..} = object
        [ "type" .= ("EditMessage" :: Text)
        , "messageId" .= messageId
        , "recipient" .= recipient
        , "content" .= content
        , "inlineCommandRows" .= maybeToList inlineCommandRows
        , "uiState" .= uiState
        , "mediaList" .= maybeToList mediaList
        ]
