{-# LANGUAGE NamedFieldPuns #-}
module Aitu.Config (
    AituBotConfig (..)
    , mkConfig) where

import Network.HTTP.Client
import qualified Data.ByteString as BS

import Aitu.Bot.Types.Aliases (Token, Url)

data AituBotConfig = Config {
    token :: Token
    , manager :: Manager
    , apiUrl :: Url
}

mkConfig :: Token -> Manager -> Url -> AituBotConfig
mkConfig token manager apiUrl = Config {token, manager, apiUrl}
