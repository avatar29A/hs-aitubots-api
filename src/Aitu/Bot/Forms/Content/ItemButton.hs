module Aitu.Bot.Forms.Content.ItemButton (ItemButton (..)) where

import Data.Text
import Aitu.Bot.Forms.FormAction (FormAction)

data ItemButton = ItemButton {
    itembuttonTitle :: Text
    , itembuttonFormAction :: FormAction
}