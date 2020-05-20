module Aitu.Bot.Forms.Content.MediaPicker (MediaPicker (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.ValidationRules (ValidationRules)

data MediaPicker = MediaPicker {
    mediapickerContentType                  :: Text
    , mediapickerContentId                  :: Text
    , mediapickerTitle                      :: Text
    , mediapickerOptions                    :: Maybe Options
    , mediapickerValidationRules            :: Maybe ValidationRules
}