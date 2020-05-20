{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.SendContactMessage (SendContactMessage (..)) where

import Data.Aeson
import Data.Text
import Data.Maybe

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.InputContact (InputContact)

-- This method is for sending message with a contact info.
-- doc: https://btsdigital.github.io/bot-api-contract/SendContactMessage.html
data SendContactMessage = SendContactMessage {
    sendContactMessageType               :: Text
    , sendContactMessageLocalId           :: Maybe Text
    , sendContactMessageRecipient         :: Peer
    , sendContactMessageInputMedia        :: InputContact} deriving (Show)

instance ToJSON SendContactMessage where
    toJSON command = object [
        "type"                  .= sendContactMessageType       command
        , "localId"             .= sendContactMessageLocalId    command
        , "recipient"           .= sendContactMessageRecipient  command
        , "inputMedia"          .= sendContactMessageInputMedia command]

instance FromJSON SendContactMessage where
    parseJSON (Object o) =
        SendContactMessage <$> o .: "type"
                            <*> o .: "localId"
                            <*> o .: "recipient"
                            <*> o .: "inputMedia"