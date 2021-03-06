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
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text
type Placeholder = Text

data TextArea = TextArea {
    contentId               :: Content.ContentID
    , title                 :: Title
    , text                  :: Text
    , placeholder           :: Maybe Placeholder
    , validationRules       :: Maybe ValidationRules
    , options               :: Maybe Options
} deriving (Show)

instance ToJSON TextArea where
    toJSON TextArea {..} = object
        [ "id" .= contentId
        , "type" .= Content.TextArea
        , "title" .= title
        , "text" .= text
        , "placeholder" .= placeholder
        , "options" .= options
        , "validations_rules" .= validationRules
        ]
