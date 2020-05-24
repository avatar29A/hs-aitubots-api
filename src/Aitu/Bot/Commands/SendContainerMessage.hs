
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}

module Aitu.Bot.Commands.SendContainerMessage
    ( SendContainerMessage(..)
    )
where

import           Data.Aeson
import           Data.Aeson.Text

import           Data.Text
import           Data.Maybe

import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )
import           Aitu.Bot.Types.UIState         ( UIState )
import           Aitu.Bot.Types.InputMedia      ( InputMedia )
import           Aitu.Bot.Types.InlineCommand   ( InlineCommand
                                                , RowInlineCommands
                                                )
import qualified Aitu.Bot.Forms.Content.Content
                                               as C
                                                ( Content(..) )

-- doc: https://btsdigital.github.io/bot-api-contract/SendContainerMessage.html
data SendContainerMessage = SendContainerMessage {
    localId         :: Maybe Text
    , recipient       :: Peer
    , content         :: [C.Content]
} deriving (Show)

instance ToJSON SendContainerMessage where
    toJSON SendContainerMessage {..} = object
        [ "type" .= ("SendContainerMessage" :: Text)
        , "localId" .= localId
        , "recipient" .= recipient
        , "content" .= encodeToLazyText content
        ]
