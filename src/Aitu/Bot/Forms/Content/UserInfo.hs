module Aitu.Bot.Forms.Content.UserInfo (UserInfo (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)

data UserInfo = UserInfo {
    userinfoContentType         :: Text
    , userinfoContentId         :: Text
    , userinfoUserId            :: Text
    , userinfoOptions           :: Maybe Options
}