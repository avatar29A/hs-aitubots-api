{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Aitu.Bot.Types.InputContact (InputContact (..)) where

import Data.Aeson
import Data.Text
import Data.UUID.Types

-- InputContact represents contact data.
-- doc: https://btsdigital.github.io/bot-api-contract/inputcontact.html
data InputContact = InputRegisteredContact { 
                        userId        :: UUID
                        , firstName     :: Maybe Text
                        , lastName      :: Maybe Text
                        , phoneNumber   :: Maybe Text
                    }
                    | InputUnregisteredContact {
                        firstName     :: Maybe Text
                        , lastName      :: Maybe Text
                        , phoneNumber   :: Maybe Text
                    }

instance FromJSON InputContact where
    parseJSON = withObject "InputContact" $ \o -> do
        (ty :: Text) <- o .: "contactType"
        case ty of
            "InputRegisteredContact" -> InputRegisteredContact <$> o .: "userId"
                                                                <*> o .:? "firstName"
                                                                <*> o .:? "lastName"
                                                                <*> o .:? "phoneNumber"

            "InputUnregisteredContact" -> InputUnregisteredContact <$> o .:? "firstName"
                                                                    <*> o .:? "lastName"
                                                                    <*> o .:? "phoneNumber"

            _ -> fail "Unsupported contact type"

instance ToJSON InputContact where
    toJSON (InputRegisteredContact userId firstName lastName phoneNumber) =
        object [
            "contactType"       .= ("InputRegisteredContact" :: Text)
            , "userId"          .= userId
            , "firstName"       .= firstName
            , "lastName"        .= lastName
            , "phoneNumber"     .= phoneNumber]

    toJSON (InputUnregisteredContact firstName lastName phoneNumber) =
        object [
            "contactType"       .= ("InputUnregisteredContact" :: Text)
            , "firstName"       .= firstName
            , "lastName"        .= lastName
            , "phoneNumber"     .= phoneNumber]
