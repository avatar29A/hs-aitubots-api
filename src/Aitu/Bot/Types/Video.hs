{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Video (Video (..)) where

import Data.Aeson
import Data.Text
import Data.UUID.Types

-- Video represents metadata on a video file.
-- doc: https://btsdigital.github.io/bot-api-contract/video.html
data Video = Video {
    videoType :: Text
    , videoFileId :: UUID
    , videoMimeType :: Text
    , videoName :: Text
    , videoSize :: Int
    , videoWidth :: Int
    , videoHeight :: Int
    , videoDuratoin :: Int
} deriving (Show)

instance FromJSON Video where
    parseJSON (Object v) =
        Video <$> v .: "type"
                <*> v .: "fileId"
                <*> v .: "mimeType"
                <*> v .: "name"
                <*> v .: "size"
                <*> v .: "width"
                <*> v .: "height"
                <*> v .: "duration"