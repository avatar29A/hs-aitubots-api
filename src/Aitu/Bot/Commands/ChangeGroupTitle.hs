{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ChangeGroupTitle (ChangeGroupTitle (..)) where

import Data.Aeson
import Data.Maybe
import Data.Text
import Data.UUID.Types

import Aitu.Bot.Types.Peer (Peer)

-- doc: https://btsdigital.github.io/bot-api-contract/KickFromGroup.html
data ChangeGroupTitle = ChangeGroupTitle {
    changeGroupTitleGroupType           :: Text
    , changeGroupTitleGroupId           :: UUID
    , changeGroupTitleTitle        :: Text
} deriving (Show)

instance ToJSON ChangeGroupTitle where
    toJSON command = object [
        "type"              .= changeGroupTitleGroupType command
        , "groupId"         .= changeGroupTitleGroupId command
        , "title"           .= changeGroupTitleTitle command]

instance FromJSON ChangeGroupTitle where
    parseJSON (Object o) = ChangeGroupTitle <$> o .: "type"
                                            <*> o .: "groupId"
                                            <*> o .: "title"