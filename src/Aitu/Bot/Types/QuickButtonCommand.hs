{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.QuickButtonCommand (QuickButtonCommand (..)) where

import Data.Aeson
import Data.Text

-- QuickButtonCommand represents a type of button sent as a part of UIstate. 
-- QuickButton is powerful item of Ui that provides execution of various functions in messenger client with the use of form action mechanism.
-- doc: https://btsdigital.github.io/bot-api-contract/quickbuttoncommand.html
data QuickButtonCommand = QuickButtonCommand {
    quickButtonCaption      :: Text
    , quickButtonAction     :: Text -- ENUM: QUICK_REQUEST | QUICK_FORM_ACTION
    , quickButtonMetadata   :: Text
} deriving (Show)

instance ToJSON QuickButtonCommand where
    toJSON command = object [
        "caption"       .= quickButtonCaption command
        , "action"      .= quickButtonAction command 
        , "metadata"    .= quickButtonMetadata command]

instance FromJSON QuickButtonCommand where
    parseJSON (Object v) =
        QuickButtonCommand  <$> v .: "caption"
                            <*> v .: "action"
                            <*> v .: "metadata"