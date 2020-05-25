{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Commands.ChangeGroupTitle
    ( ChangeGroupTitle(..)
    )
where

import           Data.Aeson
import           Data.Maybe
import           Data.Text
import           Data.UUID.Types

import           Aitu.Bot.Types.Peer            ( Peer )

type Title = Text

-- doc: https://btsdigital.github.io/bot-api-contract/ChangeGroupTitle.html
data ChangeGroupTitle = ChangeGroupTitle {
    groupId             :: UUID
    , title             :: Title
} deriving (Show)

instance ToJSON ChangeGroupTitle where
    toJSON ChangeGroupTitle {..} = object
        [ "type" .= ("ChangeGroupTitle" :: Text)
        , "groupId" .= groupId
        , "title" .= title
        ]
