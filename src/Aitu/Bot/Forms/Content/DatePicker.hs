{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.DatePicker
    ( DatePicker(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text

import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import           Aitu.Bot.Forms.Options         ( Options
                                                , DateType
                                                )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text

data DatePicker = DatePicker {
    contentId                 :: Content.ContentID
    , title                   :: Title
    , selectedDate            :: Maybe DateType
    , validationRules         :: Maybe ValidationRules
    , options                 :: Maybe Options
} deriving (Show)

instance ToJSON DatePicker where
    toJSON DatePicker {..} = object
        [ "id" .= contentId
        , "type" .= Content.DatePicker
        , "title" .= title
        , "selected_date" .= selectedDate
        , "validations_rules" .= validationRules
        , "options" .= options
        ]
