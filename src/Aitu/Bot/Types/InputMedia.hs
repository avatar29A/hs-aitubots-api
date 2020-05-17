{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Aitu.Bot.Types.InputMedia (
    InputMediaType (..)
    , InputMedia (..)) where

import Data.Aeson
import Data.Text
import GHC.Generics

data InputMediaType = DOCUMENT | IMAGE | VIDEO | AUDIO | CONTACT deriving (Show, Generic)

instance FromJSON InputMediaType
instance ToJSON InputMediaType

-- InputMedia represents a collection of metadata for media file.
-- doc: https://btsdigital.github.io/bot-api-contract/inputmedia.html
data InputMedia = InputMedia {
    inputMediaType :: InputMediaType
    , inputMediaFileId :: Text
    , inputMediaName :: Text
} deriving (Show)

instance ToJSON InputMedia where
    toJSON inputMedia = object [
        "mediaType" .= inputMediaType inputMedia
        , "fileId"  .= inputMediaFileId inputMedia
        , "name"    .= inputMediaFileId inputMedia]

instance FromJSON InputMedia where
    parseJSON (Object v) =
        InputMedia  <$> v .: "mediaType"
                    <*> v .: "fileId"
                    <*> v .: "name"
