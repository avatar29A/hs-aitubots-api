{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.Checkbox
    ( Checkbox(..)
    )
where

import           Data.Text

import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )

data Checkbox = Checkbox {
    contentId                       :: Text
    , contentType                   :: Text
    , title                         :: Text
    , defaultState                  :: Bool
    , options                       :: Maybe Options
    , validationsRules              :: Maybe ValidationRules
}
