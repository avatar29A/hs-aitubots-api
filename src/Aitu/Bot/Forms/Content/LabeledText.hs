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
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Label = Text
type Title = Text

data LabeledText = LabeledText {
    contentId          :: Content.ContentID
    , label              :: Label
    , title              :: Title
    , options            :: Maybe Options
} deriving (Show)

instance ToJSON LabeledText where
    toJSON LabeledText {..} = object
        [ "id" .= contentId
        , "type" .= Content.LabeledText
        , "label" .= label
        , "title" .= title
        , "options" .= options
        ]
