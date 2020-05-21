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
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data Submit = Submit {
    contentId         :: Text
    , contentType     :: ContentType
    , title           :: Text
    , formAction      :: FormAction
    , options         :: Maybe Options
}

instance ToJSON Submit where
    toJSON Submit {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "form_action" .= formAction
        , "options" .= options
        ]
