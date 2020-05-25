{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.DeleteMessage
    ( DeleteMessage(..)
    )
where

import           Data.Aeson
import           Data.Text
import           Data.Maybe
import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )

-- 
-- doc: https://btsdigital.github.io/bot-api-contract/DeleteMessage.html
data DeleteMessage = DeleteMessage {
    messageId               :: UUID
    , dialog           :: Peer
} deriving (Show)

instance ToJSON DeleteMessage where
    toJSON DeleteMessage {..} = object
        [ "type" .= ("DeleteMessage" :: Text)
        , "messageId" .= messageId
        , "dialog" .= dialog
        ]
