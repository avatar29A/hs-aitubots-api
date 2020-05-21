module Aitu.Bot.Forms.Form (Form (..)) where

import Data.Aeson hiding (Options)
import Data.Text

import Aitu.Bot.Forms.FormHeader (FormHeader)
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.FormContent (FormContent)
import Aitu.Bot.Forms.BottomBar (BottomBar)

data Form = Form {
    formId :: Text
    , formHeader            :: FormHeader
    , formContent           :: FormContent
    , formOptions           :: Maybe Options
    , fromBottomBar         :: Maybe BottomBar
}