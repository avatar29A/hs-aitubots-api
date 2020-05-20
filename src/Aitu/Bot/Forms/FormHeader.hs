module Aitu.Bot.Forms.FormHeader (FormHeader (..)) where

import Data.Text

import Aitu.Bot.Forms.Options (Options)

data FormHeader = FormHeader {
    formHeaderType              :: Text
    , formHeaderTitle           :: Text
    , formHeaderOptions         :: Maybe Options
}