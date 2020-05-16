{-# LANGUAGE OverloadedStrings #-}

module MainSpec (spec) where

import Control.Monad.IO.Class
import Test.Hspec

import Data.Aeson
import Data.Text.Encoding
import Data.Either
import Data.Maybe

import qualified Data.ByteString as BS
import qualified Data.UUID.V4 as UUIDV4
import qualified Data.UUID as UUID

import Network.HTTP.Client
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Aitu.Bot
import Aitu.Bot.Types

spec :: BS.ByteString -> BS.ByteString -> BS.ByteString -> Spec
spec name token chatid = do 
    manager <- runIO $ newManager tlsManagerSettings

    describe "/getMe" $
        it "responds with correct bot's name" $ do
            response <- runAituBotClient token manager getMe

            uniq <- liftIO UUIDV4.nextRandom
            let bot = fromRight Bot {botId = uniq, botName="", botUserName="<undefined>"} response
            botUserName bot `shouldBe` decodeUtf8 name

    describe "/sendMessage" $
        it "responds with code 200 - empty result" $ do
            uniq <- liftIO UUIDV4.nextRandom
            let peerId = fromJust (UUID.fromString "fe909ae9-b048-11e8-81c3-0242c0a88006")
            let peer = Peer {peerType=UserPeer
                , peerId            =   peerId
                , peerUserName      =   Nothing
                , peerFirstName     =   Nothing
                , peerLastName      =   Nothing
                , peerName          =   Nothing}

            response <- runAituBotClient token manager $ sendMessage "hi" peer
            let o = fromLeft (200, "") response
            liftIO $ print (snd o) 

            200 `shouldBe` fst o
