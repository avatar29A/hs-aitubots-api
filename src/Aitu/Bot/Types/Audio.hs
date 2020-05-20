{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Audio (Audio (..)) where

import Data.Aeson
import Data.Text
import Data.UUID.Types

-- Audio represents metadata on a audio file
-- doc: https://btsdigital.github.io/bot-api-contract/audio.html
data Audio = Audio {
    audioType :: Text
    , audioFileId :: UUID
    , audioMimeType :: Text
    , audioName :: Text
    , audioSize :: Int
    , audioDuration :: Maybe Int
} deriving (Show)

instance FromJSON Audio where
    parseJSON (Object v) =
        Audio <$> v .: "type"
                <*> v .: "fileId"
                <*> v .: "mimeType"
                <*> v .: "name"
                <*> v .: "size"
                <*> v .:? "duration"