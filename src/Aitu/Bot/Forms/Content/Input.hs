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
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text

data Input = Input {
    contentId                  :: Content.ContentID
    , title                    :: Title
    , placeholder              :: Maybe Text
    , mask                     :: Maybe Text
    , text                     :: Maybe Text
    , validationRules          :: Maybe ValidationRules
    , options                  :: Maybe Options
} deriving (Show)

instance ToJSON Input where
    toJSON Input {..} = object
        [ "id" .= contentId
        , "type" .= Content.Input
        , "title" .= title
        , "placeholder" .= placeholder
        , "mask" .= mask
        , "text" .= text
        , "validations_rules" .= validationRules
        , "options" .= options
        ]
