{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.ItemInfo
    ( ItemInfo(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )

import           Aitu.Bot.Forms.Content.Content ( ContentType )

data ItemInfo = ItemInfo {
    contentId                   :: Text
    , contentType               :: ContentType
    , title                     :: Maybe Text
    , subtitle                  :: Maybe Text
    , filemMetadata             :: Maybe FileMetadata
    , options                   :: Maybe Options
}

instance ToJSON ItemInfo where
    toJSON ItemInfo {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "title" .= title
        , "subtitle" .= subtitle
        , "file_metadata" .= filemMetadata
        , "options" .= options
        ]
