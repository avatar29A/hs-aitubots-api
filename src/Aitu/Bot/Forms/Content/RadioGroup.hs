{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.RadioGroup
    ( RadioGroup(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Content.Item    ( Item )
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )

data RadioGroup = RadioGroup {
    contentId             :: Text
    , contentType         :: Text
    , title               :: Maybe Text
    , items               :: Maybe [Item]
    , validationRules     :: Maybe ValidationRules
    , defaultValue        :: Maybe Item
}
