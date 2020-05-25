{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.DeleteGroupAvatar
    ( DeleteGroupAvatar(..)
    )
where

import           Data.Aeson
import           Data.Maybe
import           Data.Text
import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )

-- doc: https://btsdigital.github.io/bot-api-contract/DeleteGroupAvatar.html
newtype DeleteGroupAvatar = DeleteGroupAvatar {
    groupId        :: UUID
} deriving (Show)

instance ToJSON DeleteGroupAvatar where
    toJSON DeleteGroupAvatar {..} =
        object ["type" .= ("DeleteGroupAvatar" :: Text), "groupId" .= groupId]
