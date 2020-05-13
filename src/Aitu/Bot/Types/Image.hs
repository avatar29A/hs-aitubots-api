{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Image (Image) where

import Data.Aeson
import Data.Text
import Data.UUID.Types

-- Image represents metadata on a image
-- doc: https://btsdigital.github.io/bot-api-contract/image.html
data Image = Image {
    imageType :: Text
    , imageFileId :: UUID
    , imageMimeType :: Text
    , imageName :: Text
    , imageSize :: Int
    , imageWidth :: Int
    , imageHeight :: Int
} deriving (Show)

instance FromJSON Image where
    parseJSON (Object v) =
        Image <$> v .: "type"
                <*> v .: "fileId"
                <*> v .: "mimeType"
                <*> v .: "name"
                <*> v .: "size"
                <*> v .: "width"
                <*> v .: "height"