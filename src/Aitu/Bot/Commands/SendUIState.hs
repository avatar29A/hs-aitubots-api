{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.SendUIState (SendUIState (..)) where

import Data.Aeson
import Data.Text
import Data.Maybe

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.UIState (UIState)

-- This method is for sending to dialog a UiState (data classes representing current UI configuration to interact with a user).
-- doc: https://btsdigital.github.io/bot-api-contract/SendUiState.html
data SendUIState = SendUIState {
    sendUIStateType                     :: Text
    , sendUIStateRecipient              :: Peer
    , sendUIStateToDialog               :: Peer
    , sendUIStateUIState                :: UIState
}

instance ToJSON SendUIState where
    toJSON command = object [
        "type"              .= sendUIStateType command
        , "recipient"       .= sendUIStateRecipient command
        , "toDialog"        .= sendUIStateToDialog command
        , "uiState"         .= sendUIStateUIState command]

instance FromJSON SendUIState where
    parseJSON (Object o) =
        SendUIState <$> o .: "type"
                        <*> o .: "recipient"
                        <*> o .: "toDialog"
                        <*> o .: "uiState"