{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.Switch
    ( Switch(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )

data Switch = Switch {
    contentId                     :: Text
    , contentType                 :: Text
    , title                       :: Maybe Text
    , defaultState                :: Bool
    , options                     :: Maybe Options
}
