module Aitu.Bot.Forms.Content.Checkbox (Checkbox (..)) where

import Data.Text

import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.ValidationRules (ValidationRules)

data Checkbox = Checkbox {
    checkboxContentId               :: Text
    , checkboxTitle                 :: Text
    , checkboxDefaultState          :: Bool
    , checkboxOptions               :: Maybe Options
    , checkboxValidationsRules      :: Maybe ValidationRules 
}