{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.QuickButtonCommand (QuickButtonCommand) where

import Data.Aeson
import Data.Text

-- QuickButtonCommand represents a type of button sent as a part of UIstate. 
-- QuickButton is powerful item of Ui that provides execution of various functions in messenger client with the use of form action mechanism.
-- doc: https://btsdigital.github.io/bot-api-contract/quickbuttoncommand.html
data QuickButtonCommand = QuickButtonCommand {
    qbcCaption :: Text
    , qbcAction :: Text -- ENUM: QUICK_REQUEST | QUICK_FORM_ACTION
    , metadata :: Text
} deriving (Show)

instance FromJSON QuickButtonCommand where
    parseJSON (Object v) =
        QuickButtonCommand  <$> v .: "caption"
                            <*> v .: "action"
                            <*> v .: "metadata"