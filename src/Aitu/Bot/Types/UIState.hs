{-# LANGUAGE DeriveGeneric #-}

module Aitu.Bot.Types.UIState where

import Data.Aeson
import Data.Text
import GHC.Generics

import Aitu.Bot.Types.Commands.ReplyCommand (ReplyCommand)
import Aitu.Bot.Types.Commands.QuickButtonCommand (QuickButtonCommand)

-- UIState  represents a state of current UI between a service and a user.
-- doc: https://btsdigital.github.io/bot-api-contract/uistate.html
data UIState = UIState {
    canWriteText :: Bool
    , showCameraButton :: Bool
    , showShareContactButton :: Bool
    , showRecordAudioButton :: Bool
    , showGalleryButton :: Bool
    , showSpeechToTextButton :: Bool
    , replyKeyboard :: Maybe [ReplyCommand]
    , quickButtonCommands :: Maybe QuickButtonCommand
    , formMessage :: Maybe Text
} deriving (Show, Generic)

instance FromJSON UIState