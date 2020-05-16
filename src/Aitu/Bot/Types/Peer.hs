{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Peer (Peer(..)
, PeerType(..)
, mkPeerWithDefaults
, mkUserWithDefaults
, mkGroupWithDefaults
, mkBotWithDefaults
, mkChannelWithDefaults) where

import Data.Aeson
import qualified Data.Aeson.Types as JSONTypes
import Data.Text
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as BC

data PeerType = UserPeer | GroupPeer | BotPeer | ChannelPeer | UnknownPeer deriving (Enum, Eq)

instance Show PeerType where
    show UserPeer = "USER"
    show GroupPeer = "GROUP"
    show BotPeer = "BOT"
    show _ = "UNKNOWN"

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

instance ToJSON Peer where
    toJSON (Peer ty id username firstname lastname name) = object [
        "type"          .= show ty
        , "id"          .= id
        , "username"    .= username
        , "firstname"   .= firstname
        , "lastname"    .= lastname
        , "name"        .= name
        ]

instance FromJSON Peer where
    parseJSON (Object v) =
        Peer <$> v .: "type"
                <*> v .: "id"
                <*> v .:? "username"
                <*> v .:? "firstname"
                <*> v .:? "lastname"
                <*> v .:? "name"

-- mkPeerWithoutOptional makes a new Peer with Nothing value
-- for whole optional fields
mkPeerWithDefaults :: PeerType -> UUID -> Peer
mkPeerWithDefaults peerTy peerId = Peer {peerType=peerTy
                , peerId            =   peerId
                , peerUserName      =   Nothing
                , peerFirstName     =   Nothing
                , peerLastName      =   Nothing
                , peerName          =   Nothing}

mkUserWithDefaults :: UUID -> Peer
mkUserWithDefaults = mkPeerWithDefaults UserPeer

mkBotWithDefaults :: UUID -> Peer
mkBotWithDefaults = mkPeerWithDefaults BotPeer

mkChannelWithDefaults :: UUID -> Peer
mkChannelWithDefaults = mkPeerWithDefaults ChannelPeer

mkGroupWithDefaults :: UUID -> Peer
mkGroupWithDefaults = mkPeerWithDefaults GroupPeer