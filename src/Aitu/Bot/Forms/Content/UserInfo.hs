{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.UserInfo
    ( UserInfo(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

type UserId = Text

data UserInfo = UserInfo {
    contentId           :: Content.ContentID
    , userId            :: UserId
} deriving (Show)

instance ToJSON UserInfo where
    toJSON UserInfo {..} = object
        ["id" .= contentId, "type" .= Content.UserInfo, "user_id" .= userId]
