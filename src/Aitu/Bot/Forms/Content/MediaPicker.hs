{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.MediaPicker
    ( MediaPicker(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )

data MediaPicker = MediaPicker {
    contentType                  :: Text
    , contentId                  :: Text
    , title                      :: Text
    , options                    :: Maybe Options
    , validationRules            :: Maybe ValidationRules
}
