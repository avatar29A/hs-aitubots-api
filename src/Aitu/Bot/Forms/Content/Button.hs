{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Button
    ( Button(..)
    )
where

import           Data.Text
import           Data.Aeson              hiding ( Options )

import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data ButtonType = DefultButton | DefaultByContent | Alternative deriving (Show)

instance ToJSON ButtonType where
    toJSON DefultButton     = String "default"
    toJSON DefaultByContent = String "default_by_content"
    toJSON Alternative      = String "alternative"

data Button = Button {
    contentId                   :: Text
    , contentType               :: ContentType
    , buttonType                :: Maybe ButtonType
    , title                     :: Maybe Text
    , options                   :: Maybe Options
    , formAction                :: Maybe FormAction
} deriving (Show)

instance ToJSON Button where
    toJSON Button {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "button_type" .= buttonType
        , "title" .= title
        , "options" .= options
        , "form_action" .= formAction
        ]
