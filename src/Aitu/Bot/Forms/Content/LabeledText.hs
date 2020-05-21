{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.LabeledText
    ( LabeledText(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )

data LabeledText = LabeledText {
    contentType          :: Text
    , contentId          :: Text
    , label              :: Text
    , title              :: Text
    , options            :: Maybe Text
}
