# hs-aitubots-api

![Build Status](https://img.shields.io/circleci/project/klappvisor/haskell-telegram-api.svg)
![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)
![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)

High-level bindings to the Aitu Bot API based on mtl style.

## Usage

We are support mtl-style way to using Aitu Bot API. Is a based on `AituBotClient` which is just `ReaderT` monad.

:warning: In current time we are support only direct way of interact with API. WebHooks comming soon ... (or see contribute section ;))

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

## Contribution

Contributions are welcome!

1. Fork repository
2. Do your changes
3. Create pull request
4. Wait for CI build and review

You can use `stack` to build library 

```
$ stack build
```

also run tests

Unit Tests

```
$ stack test
```

or

Integration Tests

```
stack test --test-arguments "--integration -t TOKEN -c CHAT_ID -- HSPEC_ARGS"
```

where

    * TOKEN is a your bot's token
    * CHAT_ID your user id for emulate communication between you and bot.
