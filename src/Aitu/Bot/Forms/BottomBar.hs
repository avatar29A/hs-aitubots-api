module Aitu.Bot.Forms.BottomBar (BottomBar (..)) where

import Data.Text

import Aitu.Bot.Forms.FormAction (FormAction)

data BottomBar = BottomBar {
    bottomBarContentId      :: Text
    , bottomBarTitle        :: Text
    , bottomBarFormAction   :: FormAction
}