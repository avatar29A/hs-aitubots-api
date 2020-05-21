{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Input
    ( Input(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data Input = Input {
    contentId                  :: Text
    , contentType              :: ContentType
    , placeholder              :: Maybe Text
    , mask                     :: Maybe Text
    , text                     :: Maybe Text
    , options                  :: Maybe Options
    , validationRules          :: Maybe ValidationRules
} deriving (Show)

instance ToJSON Input where
    toJSON Input {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "placeholder" .= placeholder
        , "mask" .= mask
        , "text" .= text
        , "options" .= options
        , "validations_rules" .= validationRules
        ]
