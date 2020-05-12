{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Message where

import Data.Aeson
import qualified Data.Aeson.Types as JSONTypes
import Data.Text
import Data.UUID.Types

import qualified Data.ByteString.Lazy.Char8 as B
import           Data.Time.Clock                ( UTCTime )

import Aitu.Bot.Types.Peer (Peer)

newtype ForwardMetadata = ForwardMetadata {
    fmSender :: Peer
}

instance FromJSON ForwardMetadata where
    parseJSON (Object v) =
        ForwardMetadata <$> v .: "sender"

data Media = Media {
    mediaType :: Text
    , mediaFileId :: Maybe Text
}

instance FromJSON Media where
    parseJSON (Object v) =
        Media <$> v .: "type"
              <*> v .: "fileId"

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