module Aitu.Bot.Forms.Content.RadioGroup (RadioGroup (..)) where

import Data.Text
import Aitu.Bot.Forms.Content.Item (Item)
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.ValidationRules (ValidationRules)

data RadioGroup = RadioGroup {
    radiogroupContentId             :: Text
    , radiogroupContentType         :: Text
    , radiogroupTitle               :: Maybe Text
    , radiogroupItems               :: Maybe [Item] 
    , radiogroupValidationRules     :: Maybe ValidationRules
    , radiogroupDefaultValue        :: Maybe Item
}