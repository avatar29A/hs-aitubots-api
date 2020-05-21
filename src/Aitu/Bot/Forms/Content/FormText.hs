{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.FormText
    ( FormText(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data FormText = FormText {
    contentId               :: Text
    , contentType           :: ContentType
    , title                 :: Text
    , options               :: Maybe Options
    , formAction            :: Maybe FormAction
}

instance ToJSON FormText where
    toJSON FormText {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "options" .= options
        , "form_action" .= formAction
        ]
