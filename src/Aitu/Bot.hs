{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot (
    Bot (..)
    , mkConfig
    , runAituBotClient
    , runAituBotClientWithConfig
    , getMe
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

type Method = BS.ByteString

type AituBotClient a = ReaderT AituBotConfig IO (Either ClientError a)

defaultApiUrl :: Url
defaultApiUrl = "https://messapi.btsdapps.net/bot/v1/"

-- runAituBotClientWithConfig allows to run API methods with custom Config
runAituBotClientWithConfig :: AituBotConfig -> AituBotClient a -> IO (Either ClientError a)
runAituBotClientWithConfig cfg f = runReaderT f cfg

-- runAituBotClient run API requests on default API Endpoint (if need to changing, please use 'runAituBotClientWithConfig' function)
runAituBotClient :: Token -> Manager -> AituBotClient a -> IO (Either ClientError a)
runAituBotClient token manager  = runAituBotClientWithConfig (Config {token = token, manager = manager, apiUrl = defaultApiUrl })

-- getMe returns Bot info
getMe :: AituBotClient Bot 
getMe = do
    response <- invoke "GET" "getMe"
    pure (response >>= mkFromJSON)

-- sendMessage to User
sendMessage :: BS.ByteString -> AituBotClient a
sendMessage = undefined 

-- mkFromJSON is a generic function that deserialize json to Record. 
mkFromJSON :: FromJSON a => BC.ByteString -> Either ClientError a
mkFromJSON = coerceEitherStringToEitherCE . eitherDecode

-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
invoke :: Method -> Url -> AituBotClient BC.ByteString
invoke method endpoint = do 
    t <- asks token
    m <- asks manager
    baseUrl <- asks apiUrl
    let url = baseUrl <> endpoint 

    initReq <- liftIO $ parseRequest url
    let request = initReq {
        method = method
        , requestHeaders = [("x-bot-token", t)]
    }

    response <- liftIO $ httpLbs request m

    let httpCode = statusCode $ responseStatus response
    let body = responseBody response

    pure $ if httpCode /= 200 
        then Left (httpCode, body)
        else Right body