{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.ItemInfo
    ( ItemInfo(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )

data ItemInfo = ItemInfo {
    contentId                   :: Text
    , contentType               :: Text
    , title                     :: Maybe Text
    , subtitle                  :: Maybe Text
    , filemMetadata             :: Maybe FileMetadata
    , options                   :: Maybe Options
}
