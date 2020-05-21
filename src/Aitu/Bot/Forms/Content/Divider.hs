{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.Divider
    ( Divider(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )

data Divider = Divider {
    contentType            :: Text
    , contentId            :: Text
    , options              :: Maybe Options
}
