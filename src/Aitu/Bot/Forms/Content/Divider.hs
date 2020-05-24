{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Divider
    ( Divider(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )

import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data Divider = Divider {
    contentId              :: Content.ContentID
    , options              :: Maybe Options
} deriving (Show)

instance ToJSON Divider where
    toJSON Divider {..} = object
        ["id" .= contentId, "type" .= Content.Divider, "options" .= options]
