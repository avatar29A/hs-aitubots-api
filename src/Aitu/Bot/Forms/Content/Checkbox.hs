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
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data Checkbox = Checkbox {
    contentId                       :: Text
    , contentType                   :: ContentType
    , title                         :: Text
    , defaultState                  :: Bool
    , options                       :: Maybe Options
    , validationsRules              :: Maybe ValidationRules
} deriving (Show)

instance ToJSON Checkbox where
    toJSON Checkbox {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "default_state" .= defaultState
        , "options" .= options
        , "validations_rules" .= validationsRules
        ]
