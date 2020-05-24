{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.SimpleCatalog
    ( SimpleCatalog(..)
    , SimpleCatalogItem(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options
                                                , CatalogItemType
                                                )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content
import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )

type Title = Text
type Subtitle = Text

data SimpleCatalog = SimpleCatalog {
    contentId                  :: Content.ContentID
    , items                    :: [SimpleCatalogItem]
    , options                  :: Maybe Options
} deriving (Show)

instance ToJSON SimpleCatalog where
    toJSON SimpleCatalog {..} = object
        [ "id" .= contentId
        , "type" .= Content.SimpleCatalog
        , "items" .= items
        , "options" .= options
        ]

data SimpleCatalogItem = SimpleCatalogItem {
    itemId                          :: Text
    , title                         :: Title
    , subtitle                      :: Subtitle
    , description                   :: Maybe Text
    , action                        :: Maybe FormAction
    , buttons                       :: Maybe [ItemButton]
    , fileMetadata                  :: Maybe FileMetadata
    , options                       :: Maybe Options
} deriving (Show)

instance ToJSON SimpleCatalogItem where
    toJSON SimpleCatalogItem {..} = object
        [ "id" .= itemId
        , "title" .= title
        , "subtitle" .= subtitle
        , "description" .= description
        , "form_action" .= action
        , "item_buttons" .= buttons
        , "file_metadata" .= fileMetadata
        , "options" .= options
        ]

data ItemButton = ItemButton {
    title :: Text
    , formAction :: FormAction
} deriving (Show)

instance ToJSON ItemButton where
    toJSON ItemButton {..} =
        object ["title" .= title, "form_action" .= formAction]
