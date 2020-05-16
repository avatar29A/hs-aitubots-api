{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot (
    Bot (..)
    , mkConfig
    , runAituBotClient
    , runAituBotClientWithConfig
    , getMe
    , sendMessage
) where

import Control.Monad (void)
import Control.Monad.Reader
import Control.Monad.Writer

import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)

import Data.Aeson
import Data.UUID.Types as UUID
import Data.Either

import qualified Data.Text as T
import qualified Data.ByteString.Lazy.Char8 as BC
import qualified Data.ByteString as BS
import Data.Text.Encoding

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
    response <- get "getMe"
    pure (response >>= mkFromJSON)

-- sendMessage to User
sendMessage :: T.Text -> Peer -> AituBotClient ()
sendMessage content peer = do
    let command = mkSendMessageWithDefaults content peer
    let commands = Commands {commands = [command]}
    response <- post "updates" (encode commands)

    pure $ void response

-- mkFromJSON is a generic function that deserialize json to Record. 
mkFromJSON :: FromJSON a => BC.ByteString -> Either ClientError a
mkFromJSON = coerceEitherStringToEitherCE . eitherDecode

-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
get :: Url -> AituBotClient BC.ByteString
get url = invoke "GET" url "" 

-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
post :: Url -> BC.ByteString -> AituBotClient BC.ByteString
post = invoke "POST"

-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
invoke :: Method -> Url -> BC.ByteString -> AituBotClient BC.ByteString
invoke method endpoint json = do 
    t <- asks token
    m <- asks manager
    baseUrl <- asks apiUrl
    let url = baseUrl <> endpoint 

    initReq <- liftIO $ parseRequest url
    let request = initReq {
        method = method
        , requestHeaders = [("x-bot-token", t), ("content-type", "application/json")]
        , requestBody = RequestBodyLBS json
    }

    response <- liftIO $ httpLbs request m

    let httpCode = statusCode $ responseStatus response
    let body = responseBody response

    pure $ if httpCode /= 200 
        then Left (httpCode, body)
        else Right body