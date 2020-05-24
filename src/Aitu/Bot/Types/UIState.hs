{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}

module Aitu.Bot.Types.UIState
    ( UIState(..)
    , mkDefaultUIState
    )
where

import           Data.Maybe
import           Data.Aeson
import           Data.Text
import           GHC.Generics

import           Aitu.Bot.Types.ReplyCommand    ( ReplyCommand )
import           Aitu.Bot.Types.QuickButtonCommand
                                                ( QuickButtonCommand )
import           Aitu.Bot.Forms.Form            ( JsonForm )

-- UIState  represents a state of current UI between a service and a user.
-- doc: https://btsdigital.github.io/bot-api-contract/uistate.html
data UIState =
    UIState { canWriteText :: Bool
    , showCameraButton :: Bool
    , showShareContactButton :: Bool
    , showRecordAudioButton :: Bool
    , showGalleryButton :: Bool
    , showSpeechToTextButton :: Bool
    , replyKeyboard :: Maybe [ReplyCommand]
    , quickButtonCommands :: Maybe QuickButtonCommand
    , formMessage :: Maybe JsonForm
}

deriving instance Show UIState

instance ToJSON UIState where
    toJSON UIState {..} = object
        [ "canWriteText" .= canWriteText
        , "showCameraButton" .= showCameraButton
        , "showShareContactButton" .= showShareContactButton
        , "showGalleryButton" .= showGalleryButton
        , "showSpeechToTextButton" .= showSpeechToTextButton
        , "replyKeyboard" .= maybeToList replyKeyboard
        , "quickButtonCommands" .= maybeToList quickButtonCommands
        , if isJust formMessage
            then "formMessage" .= formMessage
            else "formMessage" .= ("{}" :: Text)
        ]

mkDefaultUIState :: JsonForm -> UIState
mkDefaultUIState form =
    UIState False False False False False False Nothing Nothing (Just form)
