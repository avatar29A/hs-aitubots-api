{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Form
    ( Form(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text

import           Aitu.Bot.Forms.Header          ( Header )
import           Aitu.Bot.Forms.Options         ( Options )

import           Aitu.Bot.Forms.Content.BottomBar
                                                ( BottomBar )
import           Aitu.Bot.Forms.Content.Content ( Content )

data Backdrop = Backdrop {
    formId :: Text
    , header            :: Header
    , content           :: [Content]
    , options           :: Maybe Options
    , bottomBar         :: Maybe BottomBar
} deriving (Show)

instance ToJSON Backdrop where
    toJSON Backdrop {..} = object
        [ "id" .= formId
        , "header" .= header
        , "content" .= content
        , "options" .= options
        , "bottomBar" .= bottomBar
        ]

data Form = Form {
    form :: Maybe Backdrop
} deriving (Show)

instance ToJSON Form where
    toJSON Form {..} = object ["form" .= form]
