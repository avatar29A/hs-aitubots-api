{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Peer where

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

data Peer = Peer {
    peerType :: PeerType
    , peerId :: UUID
    , userName :: Maybe Text
    , firstName :: Maybe Text
    , lastName :: Maybe Text
    , name :: Maybe Text
}

instance FromJSON Peer where
    parseJSON (Object v) =
        Peer <$> v .: "type"
                <*> v .: "id"
                <*> v .:? "username"
                <*> v .:? "firstname"
                <*> v .:? "lastname"
                <*> v .:? "name"