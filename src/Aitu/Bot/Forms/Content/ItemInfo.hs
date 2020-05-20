
module Aitu.Bot.Forms.Content.ItemInfo (ItemInfo (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.Content.FileMetadata (FileMetadata)

data ItemInfo = ItemInfo {
    iteminfoContentId                   :: Text
    , itemminfoContentType              :: Text
    , iteminfoTitle                     :: Maybe Text
    , iteminfoSubtitle                  :: Maybe Text
    , iteminfoFilemMetadata             :: Maybe FileMetadata
    , iteminfoOptions                   :: Maybe Options
}
