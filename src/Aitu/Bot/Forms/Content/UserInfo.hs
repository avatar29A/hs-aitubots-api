{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.UserInfo
    ( UserInfo(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )

data UserInfo = UserInfo {
    contentType         :: Text
    , contentId         :: Text
    , userId            :: Text
    , options           :: Maybe Options
}
