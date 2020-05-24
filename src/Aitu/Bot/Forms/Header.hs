{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Header
    ( Header(..)
    , HeaderType(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text

import           Aitu.Bot.Forms.FormAction      ( FormAction )
import           Aitu.Bot.Forms.Options         ( Options )

data HeaderType = TITLE | TOOLBAR

instance Show HeaderType where
    show TITLE   = "title"
    show TOOLBAR = "toolbar"

instance ToJSON HeaderType where
    toJSON ty = String $ (pack . show) ty

data Header = Header {
    headerType          :: HeaderType
    , title             :: Text
    , formAction        :: Maybe FormAction
    , options           :: Options
} deriving (Show)

instance ToJSON Header where
    toJSON Header {..} = object
        [ "type" .= headerType
        , "title" .= title
        , "options" .= options
        , "form_action" .= formAction
        ]
