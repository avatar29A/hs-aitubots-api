{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.InlineCommand where

import Data.Aeson
import Data.Text

-- InlineCommand represents a type of button sent in a message, 
-- it has metadata parameter returned to a service when a button is pushed.
-- doc: https://btsdigital.github.io/bot-api-contract/inlinecommand.html
data InlineCommand = InlineCommand {
    icCaption :: Text
    , icMetadata :: Text
} deriving (Show)

instance FromJSON InlineCommand where
    parseJSON (Object v) = 
        InlineCommand   <$> v .: "caption"
                        <*> v .: "metadata"