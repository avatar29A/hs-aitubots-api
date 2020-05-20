module Aitu.Bot.Forms.Content.Input (Input (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.ValidationRules (ValidationRules)

data Input = Input {
    inputContentId                  :: Text
    , inputContentType              :: Text
    , inputPlaceholder              :: Maybe Text
    , inputMask                     :: Maybe Text
    , inputText                     :: Maybe Text
    , inputOptions                  :: Maybe Options
    , inputValidationRules          :: Maybe ValidationRules
}