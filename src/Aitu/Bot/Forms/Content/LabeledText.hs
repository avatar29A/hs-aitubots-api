{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.LabeledText
    ( LabeledText(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data LabeledText = LabeledText {
    contentType          :: ContentType
    , contentId          :: Text
    , label              :: Text
    , title              :: Text
    , options            :: Maybe Text
}

instance ToJSON LabeledText where
    toJSON LabeledText {..} = object
        [ "type" .= contentType
        , "id" .= contentId
        , "label" .= label
        , "title" .= title
        , "options" .= options
        ]
