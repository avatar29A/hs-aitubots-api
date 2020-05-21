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
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data Switch = Switch {
    contentId                     :: Text
    , contentType                 :: Text
    , title                       :: Maybe Text
    , defaultState                :: Bool
    , options                     :: Maybe Options
}

instance ToJSON Switch where
    toJSON Switch {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "default_state" .= defaultState
        , "options" .= options
        ]
