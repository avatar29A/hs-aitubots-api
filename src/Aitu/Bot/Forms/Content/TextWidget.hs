{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.TextWidget
    ( TextWidget(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text

import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text
type Placeholder = Text

data TextWidget = TextWidget {
    contentId               :: Content.ContentID
    , title                 :: Title
    , formAction            :: Maybe FormAction
    , options               :: Maybe Options
} deriving (Show)

instance ToJSON TextWidget where
    toJSON TextWidget {..} = object
        [ "id" .= contentId
        , "type" .= Content.Text
        , "title" .= title
        , "form_action" .= formAction
        , "options" .= options
        ]
