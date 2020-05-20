module Aitu.Bot.Forms.Content.Submit (Submit (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.FormAction (FormAction)

data Submit = Submit {
    submitContentId         :: Text
    , submitContentType     :: Text
    , submitTitle           :: Text
    , submitFormAction      :: FormAction
    , submitOptions         :: Maybe Options
}