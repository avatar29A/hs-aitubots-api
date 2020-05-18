{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.InlineCommand (
    InlineCommand (..), 
    RowInlineCommands (..)
    ) where

import Data.Aeson
import Data.Text

type RowInlineCommands = [InlineCommand]

-- InlineCommand represents a type of button sent in a message, 
-- it has metadata parameter returned to a service when a button is pushed.
-- doc: https://btsdigital.github.io/bot-api-contract/inlinecommand.html
data InlineCommand = InlineCommand {
    inlineCommandCaption :: Text
    , inlineCommandMetadata :: Text
} deriving (Show)

instance ToJSON InlineCommand where
    toJSON command =
        object [
            "caption" .= inlineCommandCaption command
            , "metadata" .= inlineCommandMetadata command
        ]

instance FromJSON InlineCommand where
    parseJSON (Object v) = 
        InlineCommand   <$> v .: "caption"
                        <*> v .: "metadata"