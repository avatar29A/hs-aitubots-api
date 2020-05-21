{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Slider
    ( Slider(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )

import           Aitu.Bot.Forms.Content.Content ( ContentType )

data Slider = Slider {
    contentId             :: Text
    , contentType         :: ContentType
    , items               :: [SliderItem]
} deriving (Show)

instance ToJSON Slider where
    toJSON Slider {..} =
        object ["id" .= contentId, "type" .= contentType, "items" .= items]

data SliderItem = SliderItem {
    contentId :: Text
    , fileMetadata :: FileMetadata
} deriving (Show)

instance ToJSON SliderItem where
    toJSON SliderItem {..} =
        object ["id" .= contentId, "file_metadata" .= fileMetadata]
