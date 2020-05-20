module Aitu.Bot.Forms.Content.FileMetadata (FileMetadata (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)

data FileMetadata = FileMetadata {
    filemetadataFileType            :: Text
    , filemetadataFileId            :: Text
    , filemetadataFileName          :: Text
}