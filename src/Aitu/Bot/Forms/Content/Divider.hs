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

import           Aitu.Bot.Forms.Content.Content ( ContentType )

data Divider = Divider {
    contentType            :: ContentType
    , contentId            :: Text
    , options              :: Maybe Options
}

instance ToJSON Divider where
    toJSON Divider {..} =
        object ["id" .= contentId, "type" .= contentType, "options" .= options]
