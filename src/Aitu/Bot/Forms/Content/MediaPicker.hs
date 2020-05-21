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
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data MediaPicker = MediaPicker {
    contentType                  :: ContentType
    , contentId                  :: Text
    , title                      :: Text
    , options                    :: Maybe Options
    , validationRules            :: Maybe ValidationRules
}

instance ToJSON MediaPicker where
    toJSON MediaPicker {..} = object
        [ "type" .= contentType
        , "id" .= contentId
        , "title" .= title
        , "options" .= options
        , "validations_rules" .= validationRules
        ]
