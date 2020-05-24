{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Form
    ( Backdrop(..)
    , JsonForm(..)
    , Form(..)
    , mkBackdropForm
    , mkEmptyForm
    )
where

import           Data.Maybe
import           Data.Aeson              hiding ( Options )
import           Data.Aeson.Types        hiding ( Options )
import           Data.Aeson.Text
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
        , "bottom_bar" .= bottomBar
        ]

newtype JsonForm = JsonForm {
    jsonForm :: Maybe Form
} deriving (Show)

instance ToJSON JsonForm where
    toJSON JsonForm {..} = if isJust jsonForm
        then object ["jsonForm" .= encodeToLazyText jsonForm]
        else emptyObject

newtype Form = Form {
    form :: Backdrop
} deriving (Show)

instance ToJSON Form where
    toJSON Form {..} = object ["form" .= form]

mkBackdropForm :: Backdrop -> JsonForm
mkBackdropForm backdrop = JsonForm $ Just (Form backdrop)

mkEmptyForm :: JsonForm
mkEmptyForm = JsonForm Nothing
