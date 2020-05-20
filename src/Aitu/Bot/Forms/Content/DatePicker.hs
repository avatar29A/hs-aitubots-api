module Aitu.Bot.Forms.Content.DatePicker (DatePicker (..)) where

import Data.Text

import Aitu.Bot.Forms.ValidationRules (ValidationRules)
import Aitu.Bot.Forms.Options (Options)

data DatePicker = DatePicker {
    datepickerContentId                 :: Text
    , datepickerContentType             :: Text
    , datepickerTitle                   :: Maybe Text
    , datepickerSelectedDate            :: Maybe Text
    , datepickerValidationRules         :: Maybe ValidationRules
    , datepickerOptions                 :: Maybe Options
}