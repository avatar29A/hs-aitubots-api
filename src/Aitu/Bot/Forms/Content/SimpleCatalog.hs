{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.SimpleCatalog
    ( SimpleCatalog(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.Item    ( Item )

data SimpleCatalog = SimpleCatalog {
    contentId                  :: Text
    , contentType              :: Text
    , options                  :: Maybe Options
    , items                    :: [Item]
}
