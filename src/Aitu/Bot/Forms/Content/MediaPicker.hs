{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.MediaPicker
    ( MediaPicker(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text

data MediaPicker = MediaPicker {
    contentId                    :: Content.ContentID
    , title                      :: Title
    , validationRules            :: Maybe ValidationRules
    , options                    :: Maybe Options
} deriving (Show)

instance ToJSON MediaPicker where
    toJSON MediaPicker {..} = object
        [ "id" .= contentId
        , "type" .= Content.MediaPicker
        , "title" .= title
        , "options" .= options
        , "validations_rules" .= validationRules
        ]
