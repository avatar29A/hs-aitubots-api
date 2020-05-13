{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Document (Document) where

import Data.Aeson
import Data.Text
import Data.UUID.Types

-- Document represents metadata on a document.
-- doc: https://btsdigital.github.io/bot-api-contract/document.html
data Document = Document {
    documentType :: Text
    , documentFileId :: UUID
    , documentMimeType :: Text
    , documentName :: Text
    , documentSize :: Int
} deriving (Show)

instance FromJSON Document where
    parseJSON (Object v) =
        Document <$> v .: "type"
                <*> v .: "fileId"
                <*> v .: "mimeType"
                <*> v .: "name"
                <*> v .: "size"