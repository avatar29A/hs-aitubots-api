{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot
    ( AituBotClient
    , Bot(..)
    , mkConfig
    , runAituBotClient
    , runAituBotClientWithConfig
    , getMe
    , getUpdates
    , sendCommand
    , sendCommandDebug
    , sendCustomContainer
    , sendForm
    , setWebhook
    , getWebhook
    , deleteWebhook
    , uploadFile
    )
where

import           Control.Monad                  ( void )
import           Control.Monad.Reader
import           Control.Monad.Writer
import           Control.Exception

import           Network.HTTP.Client
import           Network.HTTP.Types.Status      ( statusCode )
import           Network.HTTP.Client.MultipartFormData

import           Data.Aeson
import           Data.UUID.Types               as UUID
import           Data.Either

import qualified Data.Text                     as T
import qualified Data.ByteString.Lazy.Char8    as BC
import qualified Data.ByteString               as BS
import           Data.Text.Encoding

import           Aitu.Config
import           Aitu.Bot.Types
import           Aitu.Bot.Commands
import           Aitu.Bot.Forms                 ( JsonForm )
import           Aitu.Bot.Forms.Content.CustomContainer
                                                ( CustomContainer )
import qualified Aitu.Bot.Forms.Content.Content
                                               as C
                                                ( Content(..) )
--
-- Aliases

type Url = String
type Token = String
type Method = BS.ByteString
type JSON = BC.ByteString
type FileName = T.Text

type AituBotClient a = ReaderT AituBotConfig IO (Either ClientError a)

defaultApiUrl :: Url
defaultApiUrl = "https://messapi.btsdapps.net/bot/v1/"

-- runAituBotClientWithConfig allows to run API methods with custom Config
runAituBotClientWithConfig
    :: AituBotConfig -> AituBotClient a -> IO (Either ClientError a)
runAituBotClientWithConfig cfg f = catch (runReaderT f cfg)
                                         httpExceptionHandler
  where
    httpExceptionHandler :: HttpException -> IO (Either ClientError a)
    httpExceptionHandler (HttpExceptionRequest _ (StatusCodeException r bs)) =
        pure $ Left (statusCode $ responseStatus r, BC.fromStrict bs)
    httpExceptionHandler (HttpExceptionRequest req ResponseTimeout) =
        pure $ Left (408, BC.pack ("ResponseTimeout: " ++ show req))
    httpExceptionHandler (HttpExceptionRequest req ConnectionTimeout) =
        pure $ Left (504, BC.pack ("ConnectionTimeout: " ++ show req))
    httpExceptionHandler (HttpExceptionRequest req ConnectionClosed) =
        pure $ Left (444, BC.pack ("ConnectionClosed: " ++ show req))
    httpExceptionHandler ex = throw ex

-- runAituBotClient run API requests on default API Endpoint (if need to changing, please use 'runAituBotClientWithConfig' function)
runAituBotClient
    :: Token -> Manager -> AituBotClient a -> IO (Either ClientError a)
runAituBotClient token manager = runAituBotClientWithConfig
    (Config { token = token, manager = manager, apiUrl = defaultApiUrl })

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
    let commands = Commands { commands = [command] }
    response <- post "updates" (encode commands)

    pure $ void response

-- sendCommandDebug is a generic method to invoke Platform commands with debugging print.
sendCommandDebug :: (ToJSON a) => a -> AituBotClient ()
sendCommandDebug command = do
    let commands = Commands { commands = [command] }
    --  Debugging print
    liftIO $ BC.putStrLn (encode commands)
    response <- post "updates" (encode commands)

    pure $ void response

-- sendCustomContainer
sendCustomContainer :: Peer -> [CustomContainer] -> AituBotClient ()
sendCustomContainer peer containers =
    sendCommand $ SendContainerMessage Nothing peer (map C.Content containers)

-- sendForm sends UI-form to User
sendForm :: Peer -> JsonForm -> AituBotClient ()
sendForm peer form =
    sendCommand $ SendUIState "SendUiState" peer (mkDefaultUIState form)

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

uploadFile :: FileName -> FilePath -> AituBotClient UploadFiles
uploadFile filename filepath = do
    response <- uploadFiles filename filepath
    pure (response >>= mkFromJSON)

-- uploadFile uploads file to Aitu server
uploadFiles :: FileName -> FilePath -> AituBotClient JSON
uploadFiles filename filepath = do
    t       <- asks token
    baseUrl <- asks apiUrl
    m       <- asks manager
    let url = baseUrl <> "upload"

    initReq <- liftIO $ parseRequest url
    let request = initReq
            { method         = "POST"
            , requestHeaders = [ ("x-bot-token" , (encodeUtf8 . T.pack) t)
                               , ("content-type", "application/octet-stream")
                               ]
            }

    response <-
        liftIO
        $   flip httpLbs m
        =<< formDataBody [partFileSource filename filepath] request

    let httpCode = statusCode $ responseStatus response
        body     = responseBody response

    pure $ if httpCode /= 200 then Left (httpCode, body) else Right body


-- invoke does http request to Aitu Bot Platform and returns raw data or Error.
invoke :: Method -> Url -> JSON -> AituBotClient JSON
invoke method endpoint json = do
    t       <- asks token
    m       <- asks manager
    baseUrl <- asks apiUrl
    let url = baseUrl <> endpoint

    initReq <- liftIO $ parseRequest url
    let request = initReq
            { method          = method
            , requestHeaders  = [ ("x-bot-token" , (encodeUtf8 . T.pack) t)
                                , ("content-type", "application/json")
                                ]
            , requestBody     = RequestBodyLBS json
            , responseTimeout = responseTimeoutNone
            }

    response <- liftIO $ httpLbs request m

    let httpCode = statusCode $ responseStatus response
    let body     = responseBody response

    pure $ if httpCode /= 200 then Left (httpCode, body) else Right body
