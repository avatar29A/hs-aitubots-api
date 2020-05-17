{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.ReplyCommand (ReplyCommand (..)) where

import Data.Aeson
import Data.Text

-- ReplyCommand represents a type of button sent as a part of UiState. 
-- Text of a caption is sent to a dialog as new message from user when he pushes this button.
-- doc: https://btsdigital.github.io/bot-api-contract/replycommand.html
newtype ReplyCommand = ReplyCommand {
    replyCaption :: Text
} deriving (Show)

instance ToJSON ReplyCommand where
    toJSON command = object [
        "caption" .= replyCaption command]

instance FromJSON ReplyCommand where
    parseJSON (Object v) = 
        ReplyCommand <$> v .: "caption"