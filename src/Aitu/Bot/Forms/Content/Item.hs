{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.Item
    ( Item(..)
    )
where

import           Data.Text

import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )
import           Aitu.Bot.Forms.Content.ItemButton
                                                ( ItemButton )

data Item = Item {
    itemId                          :: Text
    , title                         :: Text
    , sbtitle                       :: Text
    , options                       :: Maybe Options
    , action                        :: Maybe FormAction
    , fileMetadata                  :: Maybe FileMetadata
    , buttons                       :: Maybe [ItemButton]
}
