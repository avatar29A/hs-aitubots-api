{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.Slider
    ( Slider(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.Item    ( Item )

data Slider = Slider {
    contentId             :: Text
    , contentType         :: Text
    , items               :: [Item]
}
