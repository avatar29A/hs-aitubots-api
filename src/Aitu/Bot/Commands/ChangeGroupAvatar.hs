
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ChangeGroupAvatar (ChangeGroupAvatar (..)) where

import Data.Aeson
import Data.Maybe
import Data.Text
import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)

-- doc: https://btsdigital.github.io/bot-api-contract/ChangeGroupAvatar.html
data ChangeGroupAvatar = ChangeGroupAvatar {
    changeGroupAvatarType             :: Text
    , changeGroupAvatarGroupId        :: UUID
    , changeGroupAvatarFileId         :: UUID
}

instance ToJSON ChangeGroupAvatar where
    toJSON command = object [
        "type"                      .= changeGroupAvatarType command
        , "groupId"                 .= changeGroupAvatarGroupId command
        , "fileId"                  .= changeGroupAvatarFileId command]

instance FromJSON ChangeGroupAvatar where
    parseJSON (Object o) = ChangeGroupAvatar <$> o .: "type"
                                            <*> o .: "groupId"
                                            <*> o .: "fileId"