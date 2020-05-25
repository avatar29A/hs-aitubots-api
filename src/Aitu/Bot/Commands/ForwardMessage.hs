{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ForwardMessage
    ( ForwardMessage(..)
    )
where

import           Data.Aeson
import           Data.Text
import           Data.Maybe
import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )

-- 
-- doc: https://btsdigital.github.io/bot-api-contract/ForwardMessage.html 
data ForwardMessage = ForwardMessage {
    localId                   :: Maybe UUID
    , fromDialog              :: Peer
    , toDialog                :: Peer
    , messageId               :: UUID
} deriving (Show)

instance ToJSON ForwardMessage where
    toJSON ForwardMessage {..} = object
        [ "type" .= ("ForwardMessage" :: Text)
        , "localId" .= localId
        , "fromDialog" .= fromDialog
        , "toDialog" .= toDialog
        , "messageId" .= messageId
        ]
