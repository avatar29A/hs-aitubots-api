{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Slider
    ( Slider(..)
    , SliderItem(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )

import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data Slider = Slider {
    contentId             :: Content.ContentID
    , items               :: [SliderItem]
} deriving (Show)

instance ToJSON Slider where
    toJSON Slider {..} =
        object ["id" .= contentId, "type" .= Content.Slider, "items" .= items]

data SliderItem = SliderItem {
    contentId :: Content.ContentID
    , fileMetadata :: FileMetadata
} deriving (Show)

instance ToJSON SliderItem where
    toJSON SliderItem {..} =
        object ["id" .= contentId, "file_metadata" .= fileMetadata]
