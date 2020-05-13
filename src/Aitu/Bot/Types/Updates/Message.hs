{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Updates.Message (Message) where

import Data.Aeson
import Data.Text

import qualified Data.Aeson.Types as JSONTypes
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as B
import           Data.Time.Clock                ( UTCTime )

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.Media (Media)
import Aitu.Bot.Types.ForwardMetadata (ForwardMetadata)

-- Message  represents an update about a new message sent to dialog with a service.
-- doc: https://btsdigital.github.io/bot-api-contract/message.html 
data Message = Message {
    messageUpdateId :: Text
    , messageId :: UUID
    , messageSentAt :: UTCTime
    , messageAuthor :: Peer
    , messageDialog :: Peer
    , messageContent :: Text
    , messageForwardMetadata :: Maybe ForwardMetadata
    , messageMedia :: Maybe [Media]
    , messageLikeCount :: Int
    , messageRepostCount :: Int
    , messageViewCount :: Int
    , messageChannelPostAuthor :: Maybe Peer
}

instance FromJSON Message where
    parseJSON (Object v) =
        Message <$> v .: "updateId"
                <*> v .: "messageId"
                <*> v .: "sentAt"
                <*> v .: "author"
                <*> v .: "dialog"
                <*> v .: "content"
                <*> v .:? "forwardMetadata"
                <*> v .:? "media"
                <*> v .: "likeCount"
                <*> v .: "repostCount"
                <*> v .: "viewCount"
                <*> v .:? "channelPostAuthor"