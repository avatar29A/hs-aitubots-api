{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot (
    Bot (..)
    , mkConfig
    , runAituBotClient
    , runAituBotClientWithConfig
    , getMeM
) where

import Control.Monad.Reader
import Control.Monad.Writer

import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)

import Data.Aeson

import qualified Data.Text as T
import qualified Data.ByteString.Lazy.Char8 as BC
import qualified Data.ByteString as BS

import Aitu.Config
import Aitu.Bot.Types

type AituBotClient a = ReaderT AituBotConfig IO (Either ClientError a)

defaultApiUrl :: Url
defaultApiUrl = "https://messapi.btsdapps.net/bot/v1/"

-- runAituBotClientWithConfig ...
runAituBotClientWithConfig :: AituBotConfig -> AituBotClient a -> IO (Either ClientError a)
runAituBotClientWithConfig cfg f = runReaderT f cfg

-- runAituBotClient take a bot id and Http Manager and
runAituBotClient :: Token -> Manager -> AituBotClient a -> IO (Either ClientError a)
runAituBotClient token manager  = runAituBotClientWithConfig (Config {token = token, manager = manager, apiUrl = defaultApiUrl })

-- getMeM returns Bot info
getMeM :: AituBotClient Bot 
getMeM = do
    response <- invoke "getMe"
    pure (response >>= mkFromJSON)

-- sendMessage to User
sendMessage :: BS.ByteString -> AituBotClient a
sendMessage = undefined 

-- mkFromJSON is a generic function that deserialize json to object. 
-- All errors will be wrap to Either ClientError with a 500 status code.
mkFromJSON :: FromJSON a => BC.ByteString -> Either ClientError a
mkFromJSON = coerceEitherStringToEitherCE . eitherDecode

-- invoke does http request to Aitu Bot Platform and returns raw data or error
invoke :: Url -> AituBotClient BC.ByteString
invoke method = do 
    t <- asks token
    m <- asks manager
    baseUrl <- asks apiUrl
    let url = baseUrl <> method 

    initReq <- liftIO $ parseRequest url
    let request = initReq {
        method = "GET"
        , requestHeaders = [("x-bot-token", t)]
    }

    response <- liftIO $ httpLbs request m

    let httpCode = statusCode $ responseStatus response
    let body = responseBody response

    if httpCode /= 200 
        then pure $ Left (httpCode, body)
        else pure $ Right body