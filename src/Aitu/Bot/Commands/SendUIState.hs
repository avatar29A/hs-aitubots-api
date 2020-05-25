{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.SendUIState
    ( SendUIState(..)
    )
where

import           Data.Aeson
import           Data.Text
import           Data.Maybe

import           Aitu.Bot.Types.Peer            ( Peer )
import           Aitu.Bot.Types.UIState         ( UIState )

-- This method is for sending to dialog a UiState (data classes representing current UI configuration to interact with a user).
-- doc: https://btsdigital.github.io/bot-api-contract/SendUiState.html
data SendUIState = SendUIState {
    commandType              :: Text
    , recipient              :: Peer
    , uiState                :: UIState
} deriving (Show)

instance ToJSON SendUIState where
    toJSON SendUIState {..} = object
        [ "type" .= commandType
        , "recipient" .= recipient
        , "dialog" .= recipient
        , "uiState" .= uiState
        ]
