
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.DeleteGroupAvatar (DeleteGroupAvatar (..)) where

import Data.Aeson
import Data.Maybe
import Data.Text
import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)

-- doc: https://btsdigital.github.io/bot-api-contract/DeleteGroupAvatar.html
data DeleteGroupAvatar = DeleteGroupAvatar {
    deleteGroupAvatarType             :: Text
    , deleteGroupAvatarGroupId        :: UUID
}

instance ToJSON DeleteGroupAvatar where
    toJSON command = object [
        "type"                      .= deleteGroupAvatarType command
        , "groupId"                 .= deleteGroupAvatarGroupId command]

instance FromJSON DeleteGroupAvatar where
    parseJSON (Object o) = DeleteGroupAvatar <$> o .: "type"
                                            <*> o .: "groupId"