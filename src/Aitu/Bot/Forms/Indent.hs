{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Indent where

import           Data.Aeson
import           Data.Text

data Indent = Indent {
    left      :: Maybe Int
    , top     :: Maybe Int
    , right   :: Maybe Int
    , bottom  :: Maybe Int
} deriving (Show)

instance ToJSON Indent where
    toJSON Indent {..} = object
        ["left" .= left, "right" .= right, "bottom" .= bottom, "top" .= top]
