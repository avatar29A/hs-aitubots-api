module Aitu.Bot.Forms.Content.Switch (Switch (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)

data Switch = Switch {
    switchContentId                     :: Text
    , switchContentType                 :: Text
    , switchTitle                       :: Maybe Text
    , switchDefaultState                :: Bool
    , switchOptions                     :: Maybe Options
}