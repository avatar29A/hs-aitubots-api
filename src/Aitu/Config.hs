{-# LANGUAGE NamedFieldPuns #-}
module Aitu.Config where

import Network.HTTP.Client
import qualified Data.ByteString as BS

data AituBotConfig = Config {
    token :: Token
    , manager :: Manager
    , apiUrl :: Url
}

-- Alias Aitu Bot Token
type Token = BS.ByteString
type Url = String

mkConfig :: Token -> Manager -> Url -> AituBotConfig
mkConfig token manager apiUrl = Config {token, manager, apiUrl}
