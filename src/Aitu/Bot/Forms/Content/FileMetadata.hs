{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.FileMetadata
    ( FileMetadata(..)
    )
where

import           Data.Aeson
import           Data.Text

data FileMetadata = FileMetadata {
    fileType            :: Text
    , fileId            :: Text
    , fileName          :: Text
} deriving (Show)

instance ToJSON FileMetadata where
    toJSON FileMetadata {..} =
        object
            [ "file_type" .= fileType
            , "file_id" .= fileId
            , "file_name" .= fileName
            ]
