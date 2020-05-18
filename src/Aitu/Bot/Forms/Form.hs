module Aitu.Bot.Forms.Form where

import Data.Aeson
import Data.Text

import Aitu.Bot.Forms.FormHeader (FormHeader)
import Aitu.Bot.Forms.FormOptions (FormOptions)
import Aitu.Bot.Forms.FormContent (FormContent)
import Aitu.Bot.Forms.BottomBar (BottomBar)

data Form = Form {
    formId :: Text
    , formHeader            :: FormHeader
    , formContent           :: FormContent
    , formOptions           :: Maybe FormOptions
    , fromBottomBar         :: Maybe BottomBar
}