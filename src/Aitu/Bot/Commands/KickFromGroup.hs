{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.KickFromGroup
    ( KickFromGroup(..)
    )
where

import           Data.Aeson
import           Data.Maybe
import           Data.Text
import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )

-- doc: https://btsdigital.github.io/bot-api-contract/KickFromGroup.html
data KickFromGroup = KickFromGroup {
    groupId             :: UUID
    , peerToKick        :: Peer
} deriving (Show)

instance ToJSON KickFromGroup where
    toJSON KickFromGroup {..} = object
        [ "type" .= ("KickFromGroup" :: Text)
        , "groupId" .= groupId
        , "peerToKick" .= peerToKick
        ]
