{-# LANGUAGE NamedFieldPuns #-}
module Aitu.Config (
    AituBotConfig (..)
    , mkConfig) where

import Network.HTTP.Client
import qualified Data.ByteString as BS

type Url = String
type Token = String

data AituBotConfig = Config {
    token :: Token
    , manager :: Manager
    , apiUrl :: Url
}

mkConfig :: Token -> Manager -> Url -> AituBotConfig
mkConfig token manager apiUrl = Config {token, manager, apiUrl}
