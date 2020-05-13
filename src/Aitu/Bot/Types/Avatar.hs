{-#LANGUAGE DeriveGeneric #-}

module Aitu.Bot.Types.Avatar (Avatar) where

import Data.Aeson
import GHC.Generics

import Aitu.Bot.Types.Image (Image)

-- Avatar epresents metadata on a avatar of user, group, service
-- doc: https://btsdigital.github.io/bot-api-contract/avatar.html
data Avatar = Avatar {
    small :: Image
    , full :: Image
} deriving (Show, Generic)

instance FromJSON Avatar