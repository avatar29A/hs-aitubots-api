{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Submit
    ( Submit(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.FormAction      ( FormAction )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data Submit = Submit {
    contentId         :: Content.ContentID
    , title           :: Text
    , formAction      :: FormAction
    , options         :: Maybe Options
} deriving (Show)

instance ToJSON Submit where
    toJSON Submit {..} = object
        [ "id" .= contentId
        , "type" .= Content.Submit
        , "title" .= title
        , "form_action" .= formAction
        , "options" .= options
        ]
