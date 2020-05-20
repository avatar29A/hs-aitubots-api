{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ChangeGroupDescription (ChangeGroupDescription (..)) where

import Data.Aeson
import Data.Maybe
import Data.Text
import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)

-- doc: https://btsdigital.github.io/bot-api-contract/ChangeGroupDescription.html
data ChangeGroupDescription = ChangeGroupDescription {
    changeGroupDescriptionGroupType             :: Text
    , changeGroupDescriptionGroupId             :: UUID
    , changeGroupDescriptionDescription         :: Text
} deriving (Show)

instance ToJSON ChangeGroupDescription where
    toJSON command = object [
        "type"                      .= changeGroupDescriptionGroupType command
        , "groupId"                 .= changeGroupDescriptionGroupId command
        , "description"             .= changeGroupDescriptionDescription command]

instance FromJSON ChangeGroupDescription where
    parseJSON (Object o) = ChangeGroupDescription <$> o .: "type"
                                            <*> o .: "groupId"
                                            <*> o .: "title"