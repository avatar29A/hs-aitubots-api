{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.FormAction
    ( FormAction(..)
    )
where

import           Data.Aeson
import           Data.Text

data FormAction = FormAction {
    action            :: Text
    , dataTemplate    :: Maybe Text
    , hiddenMetadata  :: Maybe Text
} deriving (Show)

instance ToJSON FormAction where
    toJSON FormAction {..} = object
        [ "action" .= action
        , "data_template" .= dataTemplate
        , "hidden_metadata" .= hiddenMetadata
        ]
