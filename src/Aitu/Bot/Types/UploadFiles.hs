{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.UploadFiles
    ( File(..)
    , UploadFiles(..)
    )
where

import           Data.Aeson
import           Data.Text

data File = File {
    fileId :: Text
    , fileName :: Text
} deriving (Show)

instance FromJSON File where
    parseJSON (Object v) = File <$> v .: "fileId" <*> v .: "fileName"

newtype UploadFiles = UploadFiles {
    files :: [File]
} deriving (Show)

instance FromJSON UploadFiles where
    parseJSON (Object v) = UploadFiles <$> v .: "uploadedFiles"
