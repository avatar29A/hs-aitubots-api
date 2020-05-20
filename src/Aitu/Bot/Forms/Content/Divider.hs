module Aitu.Bot.Forms.Content.Divider (Divider (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)

data Divider = Divider {
    dividerContentType            :: Text
    , dividerContentId            :: Text
    , dividerOptions              :: Maybe Options
}