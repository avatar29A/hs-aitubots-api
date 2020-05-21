{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.TextArea
    ( TextArea(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data TextArea = TextArea {
    contentId               :: Text
    , contentType           :: ContentType
    , title                 :: Maybe Text
    , text                  :: Maybe Text
    , placeholder           :: Maybe Text
    , validationRules       :: Maybe ValidationRules
    , options               :: Maybe Options
}

instance ToJSON TextArea where
    toJSON TextArea {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "text" .= text
        , "placeholder" .= placeholder
        , "options" .= options
        , "validations_rules" .= validationRules
        ]
