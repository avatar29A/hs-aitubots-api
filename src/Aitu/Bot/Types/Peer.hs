{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Peer (Peer) where

import Data.Aeson
import qualified Data.Aeson.Types as JSONTypes
import Data.Text
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as BC

data PeerType = UserPeer | GroupPeer | BotPeer | ChannelPeer | UnknownPeer deriving (Show, Enum, Eq)

instance FromJSON PeerType where
    parseJSON (JSONTypes.String s) =
        pure $ case s of
            "USER" -> UserPeer
            "GROUP" -> GroupPeer
            "BOT" -> BotPeer
            "CHANNEL" -> ChannelPeer

-- Peer represents particular user, service, group dialog or channel.
-- doc: https://btsdigital.github.io/bot-api-contract/peer.html
data Peer = Peer {
    peerType :: PeerType
    , peerId :: UUID
    , peerUserName :: Maybe Text
    , peerFirstName :: Maybe Text
    , peerLastName :: Maybe Text
    , peerName :: Maybe Text
} deriving (Show)

instance FromJSON Peer where
    parseJSON (Object v) =
        Peer <$> v .: "type"
                <*> v .: "id"
                <*> v .:? "username"
                <*> v .:? "firstname"
                <*> v .:? "lastname"
                <*> v .:? "name"