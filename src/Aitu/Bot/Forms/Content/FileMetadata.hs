{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.FileMetadata
    ( FileMetadata(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )

data FileMetadata = FileMetadata {
    fileType            :: Text
    , fileId            :: Text
    , fileName          :: Text
}
