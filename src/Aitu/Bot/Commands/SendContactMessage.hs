{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.SendContactMessage
    ( SendContactMessage(..)
    )
where

import           Data.Aeson
import           Data.Text
import           Data.Maybe

import           Aitu.Bot.Types.Peer            ( Peer )
import           Aitu.Bot.Types.InputContact    ( InputContact )

-- This method is for sending message with a contact info.
-- doc: https://btsdigital.github.io/bot-api-contract/SendContactMessage.html
data SendContactMessage = SendContactMessage {
    localId             :: Maybe Text
    , recipient         :: Peer
    , inputMedia        :: InputContact} deriving (Show)

instance ToJSON SendContactMessage where
    toJSON SendContactMessage {..} = object
        [ "type" .= ("SendContactMessage" :: Text)
        , "localId" .= localId
        , "recipient" .= recipient
        , "inputMedia" .= inputMedia
        ]
