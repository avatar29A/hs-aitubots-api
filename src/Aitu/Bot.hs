{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot (
    AituBotClient
    , Bot (..)
    , mkConfig
    , runAituBotClient
    , runAituBotClientWithConfig
    , getMe
    , getUpdates
    , sendCommand
    , sendCommands
    , setWebhook
    , getWebhook
    , deleteWebhook
) where

import Control.Monad (void)
import Control.Monad.Reader
import Control.Monad.Writer
import Control.Exception

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
import Aitu.Bot.Commands

--
-- Aliases

type Url = String
type Token = String
type Method = BS.ByteString
type JSON = BC.ByteString

type AituBotClient a = ReaderT AituBotConfig IO (Either ClientError a)

defaultApiUrl :: Url
defaultApiUrl = "https://messapi.btsdapps.net/bot/v1/"

-- runAituBotClientWithConfig allows to run API methods with custom Config
runAituBotClientWithConfig :: AituBotConfig -> AituBotClient a -> IO (Either ClientError a)
runAituBotClientWithConfig cfg f = catch (runReaderT f cfg) httpExceptionHandler
    where
        httpExceptionHandler :: HttpException -> IO (Either ClientError a)
        httpExceptionHandler (HttpExceptionRequest _ (StatusCodeException r bs)) = pure $ Left (statusCode $ responseStatus r, BC.fromStrict bs)
        httpExceptionHandler (HttpExceptionRequest req ResponseTimeout ) = pure $ Left (408, BC.pack ("ResponseTimeout: " ++ show req))
        httpExceptionHandler (HttpExceptionRequest req ConnectionTimeout) = pure $ Left (504, BC.pack ("ConnectionTimeout: " ++ show req))
        httpExceptionHandler (HttpExceptionRequest req ConnectionClosed) = pure $ Left (444, BC.pack ("ConnectionClosed: " ++ show req))
        httpExceptionHandler ex = throw ex

-- runAituBotClient run API requests on default API Endpoint (if need to changing, please use 'runAituBotClientWithConfig' function)
runAituBotClient :: Token -> Manager -> AituBotClient a -> IO (Either ClientError a)
runAituBotClient token manager  = runAituBotClientWithConfig (Config {token = token, manager = manager, apiUrl = defaultApiUrl })

-- getMe returns Bot about.
getMe :: AituBotClient Bot
getMe = get' "getMe"

-- setWebhook
setWebhook :: WebHookInfo -> AituBotClient ()
setWebhook info = do
    response <- post "webhook" (encode info)
    pure $ void response

-- getWebhook
getWebhook :: AituBotClient WebHookInfo
getWebhook = get' "webhook"

-- deleteWebhook
deleteWebhook :: AituBotClient ()
deleteWebhook = do
    response <- invoke "DELETE" "webhook" ""
    pure $ void response

-- getUpdates retrives updates using long polling way.
getUpdates :: AituBotClient Updates
getUpdates = get' "updates"

-- sendCommand is a generic method to invoke Platform commands.
sendCommand :: (ToJSON a) => a -> AituBotClient ()
sendCommand command = do
    let commands = Commands {commands = [command]}
    response <- post "updates" (encode commands)

    pure $ void response

sendCommands :: (ToJSON a) => [a] -> AituBotClient ()
sendCommands [] = pure $ Right ()
sendCommands (x:xs) = do
    let r = sendCommand x
    _ <- r
    sendCommands xs

-- mkFromJSON is a generic function that deserialize json to Record. 
mkFromJSON :: FromJSON a => BC.ByteString -> Either ClientError a
mkFromJSON = coerceEitherStringToEitherCE . eitherDecode

-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
get :: Url -> AituBotClient BC.ByteString
get url = invoke "GET" url ""

-- get' does GET-query and convert result from Json to a.
get' :: (FromJSON a) => Url -> AituBotClient a
get' url = do
    response <- get url
    pure (response >>= mkFromJSON)

-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
post :: Url -> BC.ByteString -> AituBotClient BC.ByteString
post = invoke "POST"

-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
invoke :: Method -> Url -> JSON -> AituBotClient JSON
invoke method endpoint json = do
    t <- asks token
    m <- asks manager
    baseUrl <- asks apiUrl
    let url = baseUrl <> endpoint

    initReq <- liftIO $ parseRequest url
    let request = initReq {
        method = method
        , requestHeaders = [("x-bot-token", (encodeUtf8 . T.pack) t), ("content-type", "application/json")]
        , requestBody = RequestBodyLBS json
        , responseTimeout = responseTimeoutNone
    }

    response <- liftIO $ httpLbs request m

    let httpCode = statusCode $ responseStatus response
    let body = responseBody response

    pure $ if httpCode /= 200
        then Left (httpCode, body)
        else Right body