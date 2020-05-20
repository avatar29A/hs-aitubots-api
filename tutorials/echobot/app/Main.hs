module Main where

import System.Environment (lookupEnv)
import Control.Monad (forever, foldM)
import Network.HTTP.Client (newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Data.Maybe (fromMaybe)

import Aitu.Bot
import Aitu.Bot.Types
import Aitu.Bot.Commands

main :: IO ()
main = do
    -- Extract Bot API Token from Environment
    envToken <- lookupEnv "AITU_BOT_TOKEN"
    let token = fromMaybe "" envToken

    -- Create http client with TLS
    manager <- newManager tlsManagerSettings

    -- Run forever-loop for listening Updates
    forever $ do
        response  <- runAituBotClient token manager $ do
            eitherUpdates <- getUpdates

            -- Extracts Updates from Either and converts to SendMessageCommands (only Message updates)
            let sendMessageCommands = foldl (\acc u -> case u of
                                        Message {messageAuthor=author, 
                                                    messageContent=content} -> 
                                                        mkSendMessageWithDefaults content author : acc
                                        _ -> acc
                                        ) [] (either (const []) updates eitherUpdates)

            -- response on all Messages
            foldM (\acc cmd -> sendCommand cmd) (Right ()) sendMessageCommands

        pure ()