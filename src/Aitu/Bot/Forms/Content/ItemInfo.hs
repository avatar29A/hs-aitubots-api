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

import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type Title = Text
type Subtitle = Text

data ItemInfo = ItemInfo {
    contentId                   :: Content.ContentID
    , title                     :: Maybe Title
    , subtitle                  :: Maybe Subtitle
    , fileMetadata             :: Maybe FileMetadata
    , options                   :: Maybe Options
} deriving (Show)

instance ToJSON ItemInfo where
    toJSON ItemInfo {..} = object
        [ "id" .= contentId
        , "type" .= Content.ItemInfo
        , "title" .= title
        , "subtitle" .= subtitle
        , "file_metadata" .= fileMetadata
        , "options" .= options
        ]
