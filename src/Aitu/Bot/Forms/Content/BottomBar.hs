{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.BottomBar
    ( BottomBar(..)
    )
where

import           Data.Aeson
import           Data.Text

import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data BottomBar = BottomBar {
    contentId           :: Text
    , contentType       :: ContentType
    , title             :: Text
    , formAction        :: FormAction
} deriving (Show)

instance ToJSON BottomBar where
    toJSON BottomBar {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "form_action" .= formAction
        ]
