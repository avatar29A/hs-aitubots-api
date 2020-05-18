{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.KickFromGroup (KickFromGroup (..)) where

import Data.Aeson
import Data.Maybe
import Data.Text
import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)

-- doc: https://btsdigital.github.io/bot-api-contract/KickFromGroup.html
data KickFromGroup = KickFromGroup {
    kickFromGroupType           :: Text
    , kickFromGroupId           :: UUID
    , kickFromPeerToKick        :: Peer
}

instance ToJSON KickFromGroup where
    toJSON command = object [
        "type"              .= kickFromGroupType command
        , "groupId"         .= kickFromGroupId command
        , "peerToKick"      .= kickFromPeerToKick command]

instance FromJSON KickFromGroup where
    parseJSON (Object o) = KickFromGroup <$> o .: "type"
                                            <*> o .: "groupId"
                                            <*> o .: "peerToKick"