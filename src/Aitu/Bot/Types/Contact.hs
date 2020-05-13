{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Contact (
    RegisteredContact, 
    UnRegisteredContact) where

import Data.Aeson
import Data.Text
import Data.UUID.Types

import Aitu.Bot.Types.User (User)

-- Module represents data on contact. Contacts can be represented by registered and unregistered users in messenger.
-- doc: https://btsdigital.github.io/bot-api-contract/contact.html

data RegisteredContact = RegisteredContact {
    rcType :: Text
    , rcUser :: User
} deriving (Show)

instance FromJSON RegisteredContact where
    parseJSON (Object v) = 
        RegisteredContact <$> v .: "type"
                            <*> v .: "user"

data UnRegisteredContact = UnRegisteredContact {
    urcType :: Text
    , urcFirstName :: Maybe String
    , urcLastName :: Maybe String
    , urcPhoneNumber :: Maybe String
}

instance FromJSON UnRegisteredContact where
    parseJSON (Object v) =
        UnRegisteredContact <$> v .: "type"
                            <*> v .:? "firstName"
                            <*> v .:? "lastName"
                            <*> v .:? "phoneNumber"