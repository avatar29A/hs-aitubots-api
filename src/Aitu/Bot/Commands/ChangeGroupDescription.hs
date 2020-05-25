{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ChangeGroupDescription
    ( ChangeGroupDescription(..)
    )
where

import           Data.Aeson
import           Data.Maybe
import           Data.Text
import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )

-- doc: https://btsdigital.github.io/bot-api-contract/ChangeGroupDescription.html
data ChangeGroupDescription = ChangeGroupDescription {
    groupId                 :: UUID
    , description           :: Text
} deriving (Show)

instance ToJSON ChangeGroupDescription where
    toJSON ChangeGroupDescription {..} = object
        [ "type" .= ("ChangeGroupDescription" :: Text)
        , "groupId" .= groupId
        , "description" .= description
        ]
