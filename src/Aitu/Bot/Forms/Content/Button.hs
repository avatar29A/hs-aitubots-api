module Aitu.Bot.Forms.Content.Button (Button (..)) where

import Data.Text

import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.FormAction (FormAction)

data Button = Button {
    buttonContentId             :: Text
    , buttonTitle               :: Maybe Text
    , buttonType                :: Maybe Text
    , buttonOptions             :: Maybe Options
    , buttonFormAction          :: Maybe FormAction
}