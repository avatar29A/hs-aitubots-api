{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.RadioGroup
    ( RadioGroup(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data RadioGroup = RadioGroup {
    contentId             :: Text
    , contentType         :: ContentType
    , title               :: Maybe Text
    , items               :: Maybe [RadioItem]
    , validationRules     :: Maybe ValidationRules
    , defaultValue        :: Maybe RadioItem
    , options              :: Maybe Options
}

instance ToJSON RadioGroup where
    toJSON RadioGroup {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "items" .= items
        , "validations_rules" .= validationRules
        , "default_value" .= defaultValue
        , "options" .= options
        ]

data RadioItem = RadioItem {
    contentId :: Text
    , title :: Maybe Text
} deriving (Show)

instance ToJSON RadioItem where
    toJSON RadioItem {..} = object ["id" .= contentId, "title" .= title]
