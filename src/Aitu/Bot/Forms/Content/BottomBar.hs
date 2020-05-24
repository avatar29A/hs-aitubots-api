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
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data BottomBar = BottomBar {
    contentId           :: Content.ContentID
    , title             :: Text
    , formAction        :: FormAction
} deriving (Show)

instance ToJSON BottomBar where
    toJSON BottomBar {..} = object
        [ "id" .= contentId
        , "type" .= Content.BottomBar
        , "title" .= title
        , "form_action" .= formAction
        ]
