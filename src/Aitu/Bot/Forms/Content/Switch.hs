{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Switch
    ( Switch(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data Switch = Switch {
    contentId                     :: Content.ContentID
    , title                       :: Text
    , defaultState                :: Bool
    , options                     :: Maybe Options
} deriving (Show)

instance ToJSON Switch where
    toJSON Switch {..} = object
        [ "id" .= contentId
        , "type" .= Content.Switch
        , "title" .= title
        , "default_state" .= defaultState
        , "options" .= options
        ]
