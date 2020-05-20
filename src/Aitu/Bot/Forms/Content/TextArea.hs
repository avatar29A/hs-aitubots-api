module Aitu.Bot.Forms.Content.TextArea (TextArea (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.ValidationRules (ValidationRules)

data TextArea = TextArea {
    textareaContentId               :: Text
    , textareaContentType           :: Text
    , textareaTitle                 :: Maybe Text
    , textareaText                  :: Maybe Text
    , textareaPlaceholder           :: Maybe Text
    , textareaValidationRules       :: Maybe ValidationRules
    , textareaOptions               :: Maybe Options
}