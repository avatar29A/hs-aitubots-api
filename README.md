# hs-aitubots-api

High-level bindings to the Aitu Bot API based on mtl style.

## Examples

### getMe

```haskell
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.HTTP.Client
import Network.HTTP.Client.TLS (tlsManagerSettings)

import qualified Data.ByteString.Lazy.Char8 as BC

import Aitu.Bot

main :: IO ()
main = do
    let token = "<YOUR_BOT_TOKEN>"

    manager <- newManager tlsManagerSettings
    response <- runAituBotClient token manager $ do 
        getMeM

    case response of
        Left (code, errMsg) -> BC.putStrLn errMsg
        Right me -> print me
```
