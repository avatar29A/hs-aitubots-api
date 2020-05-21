{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.DatePicker
    ( DatePicker(..)
    )
where

import           Data.Text

import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )
import           Aitu.Bot.Forms.Options         ( Options )

data DatePicker = DatePicker {
    contentId                 :: Text
    , contentType             :: Text
    , title                   :: Maybe Text
    , selectedDate            :: Maybe Text
    , validationRules         :: Maybe ValidationRules
    , options                 :: Maybe Options
}
