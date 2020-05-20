# echobot

Tutorial describes how to write simple echo bot for Aitu Bot Platform. Bot always replay message back to user.

## Requirements

1. stack (latest)
2. GHC 8.6.5 (lts-resolver 14.11)

## Steps

1. сreate a new haskell project throught stack 

```sh
$ stack new echobot
```

2. add hs-aitubot-api as extra-dependencies into `stack.yaml`

```yaml
extra-deps:
- https://github.com/avatar29A/hs-aitubots-api/releases/download/0.1.0.0/hs-aitubots-api-0.1.0.0.tar.gz
```

3. add hs-aitubot-api as dependencies into packages.yaml

```yaml
dependencies:
- hs-aitubots-api
- base >= 4.7 && < 5
```

4. add other usefull dependencies into package.yaml

```yaml
dependencies:
- text
- bytestring
- hs-aitubots-api
- http-client
- http-client-tls
- base >= 4.7 && < 5
```

5. First, we need to initializing the AituBotClient

```hs
import Network.HTTP.Client (newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Aitu.Bot

main :: IO ()
main = do
    -- Extract Bot API Token from Environment
    envToken <- lookupEnv "AITU_BOT_TOKEN"
    let token = fromMaybe "" envToken

    -- Create http client with TLS
    manager <- newManager tlsManagerSettings

    response  <- runAituBotClient token manager $ do
        -- here we can invoke API methods
```

6. Takes from updates only updates with type of `Message` and then convert `Message` to `SendMessageCommand` (through foldl)

```hs
    response  <- runAituBotClient token manager $ do
        -- take recent updates (batch of updates)
        eitherUpdates <- getUpdates

        -- extract updates from (Either ClientError Updates)
        let updates' = either (const []) updates eitherUpdates

        --  converting Message to SendMessageCommand
        let sendMessageCommands = foldl (\acc u -> case u of
                                        Message {messageAuthor=author, 
                                                    messageContent=content} -> 
                                                        mkSendMessageWithDefaults content author : acc
                                        _ -> acc
                                        ) [] updates

```

7. Reply to all messages

```hs
-- replay to all messages
foldM (\acc cmd -> sendCommand cmd) (Right ()) sendMessageCommands
```

8. And finally, wrap to `forever` our code

```hs
forever $ do
    response  <- runAituBotClient token manager $ do
        ...
```

All together

```hs
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

            let updates' = either (const []) updates eitherUpdates

            -- Extracts Updates from Either and converts to SendMessageCommands (only Message updates)
            let sendMessageCommands = foldl (\acc u -> case u of
                                        Message {messageAuthor=author, 
                                                    messageContent=content} -> 
                                                        mkSendMessageWithDefaults content author : acc
                                        _ -> acc
                                        ) [] updates'

            -- replay to all messages
            foldM (\acc cmd -> sendCommand cmd) (Right ()) sendMessageCommands

        pure ()
```

