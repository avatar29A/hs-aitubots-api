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
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text

data FormText = FormText {
    contentId               :: Content.ContentID
    , title                 :: Title
    , formAction            :: Maybe FormAction
    , options               :: Maybe Options
}

instance ToJSON FormText where
    toJSON FormText {..} = object
        [ "id" .= contentId
        , "type" .= Content.FormText
        , "title" .= title
        , "form_action" .= formAction
        , "options" .= options
        ]
