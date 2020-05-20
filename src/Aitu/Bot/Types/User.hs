{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.User (User (..)) where

import Data.Aeson
import Data.Text
import Data.UUID.Types

import Aitu.Bot.Types.Avatar (Avatar)

-- User  represents data on a user of a messenger
-- doc: https://btsdigital.github.io/bot-api-contract/user.html
data User = User {
    userUserId :: UUID
    , userFirstName :: Maybe Text
    , userLastName :: Maybe Text
    , userPhoneNumber :: Maybe Text
    , userName :: Maybe Text
    , userAvatar :: Maybe Avatar
} deriving (Show)

instance FromJSON User where
    parseJSON (Object v) =
        User <$> v .: "id"
                <*> v .:? "firstName"
                <*> v .:? "lastName"
                <*> v .:? "phoneNumber"
                <*> v .:? "userName"
                <*> v .:? "userAvatar"
