{-# LANGUAGE DeriveGeneric #-}

module Aitu.Bot.Types.WebHookInfo (WebHookInfo) where

import Data.Aeson
import Data.Text
import GHC.Generics

-- WebHookInfo represents url set for service to get updates on.
-- doc: https://btsdigital.github.io/bot-api-contract/webhookinfo.html
newtype WebHookInfo = WebHookInfo {
    url :: Text
} deriving (Show, Generic)

instance FromJSON WebHookInfo
instance ToJSON WebHookInfo