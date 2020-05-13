{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Media (Media) where

import Data.Aeson
import Data.Text

data Media = Media {
    mediaType :: Text
    , mediaFileId :: Maybe Text
}

instance FromJSON Media where
    parseJSON (Object v) =
        Media   <$> v .: "type"
                <*> v .: "fileId"