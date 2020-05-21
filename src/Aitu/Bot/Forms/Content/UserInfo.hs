{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.UserInfo
    ( UserInfo(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data UserInfo = UserInfo {
    contentType         :: ContentType
    , contentId         :: Text
    , userId            :: Text
}

instance ToJSON UserInfo where
    toJSON UserInfo {..} =
        object ["id" .= contentId, "type" .= contentType, "user_id" .= userId]
