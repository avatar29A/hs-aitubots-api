{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ChangeGroupAvatar
    ( ChangeGroupAvatar(..)
    )
where

import           Data.Aeson
import           Data.Maybe
import           Data.Text
import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )

-- doc: https://btsdigital.github.io/bot-api-contract/ChangeGroupAvatar.html
data ChangeGroupAvatar = ChangeGroupAvatar {
    groupId        :: UUID
    , fileId         :: UUID
} deriving (Show)

instance ToJSON ChangeGroupAvatar where
    toJSON ChangeGroupAvatar {..} = object
        [ "type" .= ("ChangeGruopAvatar" :: Text)
        , "groupId" .= groupId
        , "fileId" .= fileId
        ]
