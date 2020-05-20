module Aitu.Bot.Forms.Content.FormText (FormText (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.FormAction (FormAction)

data FormText = FormText {
    textContentId               :: Text
    , textContentType           :: Text
    , textTitle                 :: Text
    , textOptions               :: Maybe Options
    , textFormAction            :: Maybe FormAction
}