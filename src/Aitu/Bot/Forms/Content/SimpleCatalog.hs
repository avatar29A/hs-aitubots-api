module Aitu.Bot.Forms.Content.SimpleCatalog (SimpleCatalog (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.Content.Item (Item)

data SimpleCatalog = SimpleCatalog {
    simplecatalogContentId                  :: Text
    , simplecatalogContentType              :: Text
    , simplecatalogOptions                  :: Maybe Options
    , simplecatalogItems                    :: [Item]
}