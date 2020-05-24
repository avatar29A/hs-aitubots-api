{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.FormAction
    ( FormAction(..)
    , FormActionType(..)
    , DataTemplate(..)
    )
where

import           Data.Aeson
import           Data.Text


type UserName = Text
type Url = Text
type Template = Text

data FormActionType = SendMessageAction | SubmitFormAction | CloseFormAction | OpenUrlAction | ShareDataAction | OpenPeerAction deriving (Show)

instance ToJSON FormActionType where
    toJSON SendMessageAction = String "send_message"
    toJSON SubmitFormAction  = String "submit_form"
    toJSON CloseFormAction   = String "close_form"
    toJSON OpenUrlAction     = String "open_url"
    toJSON ShareDataAction   = String "share_data"
    toJSON OpenPeerAction    = String "open_peer"

data DataTemplate = DataTemplate Template | EmptyTemplate  deriving (Show)

instance ToJSON DataTemplate where
    toJSON (DataTemplate template) = String template
    toJSON EmptyTemplate           = String ("" :: Text)

data FormAction = FormAction {
    action              :: FormActionType
    , dataTemplate      :: DataTemplate
    -- , hiddenMetadata    :: Maybe Text
} deriving (Show)

instance ToJSON FormAction where
    toJSON FormAction {..} = object
        [ "action" .= action
        , "data_template" .= dataTemplate
        -- , "hidden_metadata" .= hiddenMetadata
        ]
