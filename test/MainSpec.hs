{-# LANGUAGE OverloadedStrings #-}

module MainSpec (spec) where

import Control.Monad.IO.Class
import Test.Hspec
import Data.Text.Encoding
import Data.Either

import qualified Data.ByteString as BS
import qualified Data.UUID.V4 as UUID

import Network.HTTP.Client
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Aitu.Bot
import qualified Aitu.Bot.Types as AituTypes

spec :: BS.ByteString -> BS.ByteString -> BS.ByteString -> Spec
spec name token chatid = do 
    manager <- runIO $ newManager tlsManagerSettings

    describe "/getMe" $
        it "responds with correct bot's name" $ do
            response <- runAituBotClient token manager getMe

            liftIO $ print token
            liftIO $ print response

            uniq <- liftIO UUID.nextRandom
            let bot = fromRight Bot {botId = uniq, botName="", botUserName="<undefined>"} response
            AituTypes.botUserName bot `shouldBe` decodeUtf8 name