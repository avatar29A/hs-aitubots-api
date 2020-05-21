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
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data DatePicker = DatePicker {
    contentId                 :: Text
    , contentType             :: ContentType
    , title                   :: Maybe Text
    , selectedDate            :: Maybe DateType
    , validationRules         :: Maybe ValidationRules
    , options                 :: Maybe Options
}

instance ToJSON DatePicker where
    toJSON DatePicker {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "selected_date" .= selectedDate
        , "validations_rules" .= validationRules
        , "options" .= options
        ]
