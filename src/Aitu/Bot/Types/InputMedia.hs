{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.InputMedia (InputMedia) where

import Data.Aeson
import Data.Text

-- InputMedia represents a collection of metadata for media file.
-- doc: https://btsdigital.github.io/bot-api-contract/inputmedia.html
data InputMedia = InputMedia {
    imType :: Text
    , imFileId :: Text
    , imName :: Text
} deriving (Show)

instance FromJSON InputMedia where
    parseJSON (Object v) =
        InputMedia  <$> v .: "mediaType"
                    <*> v .: "fileId"
                    <*> v .: "name"
