{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.FileMetadata
    ( FileMetadata(..)
    )
where

import           Data.Aeson
import           Data.Text

import           Aitu.Bot.Forms.Options         ( MediaType )

type FileId = Text
type FileName = Text

data FileMetadata = FileMetadata {
    fileId                  :: FileId
    , fileType              :: MediaType
    , fileName              :: FileName
} deriving (Show)

instance ToJSON FileMetadata where
    toJSON FileMetadata {..} =
        object
            [ "file_id" .= fileId
            , "file_type" .= fileType
            , "filename" .= fileName
            ]
