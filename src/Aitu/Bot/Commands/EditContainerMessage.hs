
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.EditContainerMessage
    ( EditContainerMessage(..)
    )
where

import           Data.Aeson
import           Data.Text
import           Data.Maybe

import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )
import           Aitu.Bot.Types.UIState         ( UIState )
import           Aitu.Bot.Types.InputMedia      ( InputMedia )
import           Aitu.Bot.Types.InlineCommand   ( InlineCommand
                                                , RowInlineCommands
                                                )

-- doc: https://btsdigital.github.io/bot-api-contract/EditContainerMessage.html
data EditContainerMessage = EditContainerMessage {
    recipient       :: Peer
    , content         :: Text
} deriving (Show)

instance ToJSON EditContainerMessage where
    toJSON EditContainerMessage {..} = object
        [ "type" .= ("EditContainerMessage" :: Text)
        , "recipient" .= recipient
        , "content" .= content
        ]
