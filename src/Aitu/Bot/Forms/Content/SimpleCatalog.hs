{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.SimpleCatalog
    ( SimpleCatalog(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.Content ( ContentType )
import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )

data SimpleCatalog = SimpleCatalog {
    contentId                  :: Text
    , contentType              :: ContentType
    , options                  :: Maybe Options
    , items                    :: [Item]
} deriving (Show)

instance ToJSON SimpleCatalog where
    toJSON SimpleCatalog {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "options" .= options
        , "items" .= items
        ]

data Item = Item {
    itemId                          :: Text
    , title                         :: Text
    , subtitle                      :: Text
    , options                       :: Maybe Options
    , action                        :: Maybe FormAction
    , fileMetadata                  :: Maybe FileMetadata
    , buttons                       :: Maybe [ItemButton]
} deriving (Show)

instance ToJSON Item where
    toJSON Item {..} = object
        [ "title" .= title
        , "subtitle" .= subtitle
        , "options" .= options
        , "action" .= action
        , "file_metadata" .= fileMetadata
        , "buttons" .= buttons
        ]

data ItemButton = ItemButton {
    title :: Text
    , formAction :: FormAction
} deriving (Show)

instance ToJSON ItemButton where
    toJSON ItemButton {..} =
        object ["title" .= title, "form_action" .= formAction]
