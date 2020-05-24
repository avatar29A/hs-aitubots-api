{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.RadioGroup
    ( RadioGroup(..)
    , RadioItem(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text

data RadioGroup = RadioGroup {
    contentId             :: Content.ContentID
    , title               :: Title
    , items               :: [RadioItem]
    , defaultValue        :: Maybe RadioItem
    , validationRules     :: Maybe ValidationRules
    , options             :: Maybe Options
} deriving (Show)

instance ToJSON RadioGroup where
    toJSON RadioGroup {..} = object
        [ "id" .= contentId
        , "type" .= Content.RadioGroup
        , "title" .= title
        , "items" .= items
        , "default_value" .= defaultValue
        , "validations_rules" .= validationRules
        , "options" .= options
        ]

data RadioItem = RadioItem {
    contentId   :: Content.ContentID
    , title     :: Title
} deriving (Show)

instance ToJSON RadioItem where
    toJSON RadioItem {..} = object ["id" .= contentId, "title" .= title]
