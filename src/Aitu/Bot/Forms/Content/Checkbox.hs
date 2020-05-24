{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Checkbox
    ( Checkbox(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text

import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data Checkbox = Checkbox {
    contentId                       :: Content.ContentID
    , title                         :: Text
    , defaultState                  :: Bool
    , validationRules               :: Maybe ValidationRules
    , options                       :: Maybe Options
} deriving (Show)

instance ToJSON Checkbox where
    toJSON Checkbox {..} = object
        [ "id" .= contentId
        , "type" .= Content.Checkbox
        , "title" .= title
        , "default_state" .= defaultState
        , "options" .= options
        , "validations_rules" .= validationRules
        ]
