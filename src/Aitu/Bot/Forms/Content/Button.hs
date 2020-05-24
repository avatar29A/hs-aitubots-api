{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Button
    ( Button(..)
    , ButtonType(..)
    )
where

import           Data.Text
import           Data.Aeson              hiding ( Options
                                                , defaultOptions
                                                )

import           Aitu.Bot.Forms.Options         ( Options
                                                , backgroundColor
                                                , defaultOptions
                                                )
import           Aitu.Bot.Forms.FormAction      ( FormAction(..) )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data ButtonType = DefaultButton | DefaultByContent | Alternative deriving (Show)

instance ToJSON ButtonType where
    toJSON DefaultButton    = String "default"
    toJSON DefaultByContent = String "default_by_content"
    toJSON Alternative      = String "alternative"

type Id = Text
type Title = Text

data Button = Button {
    contentId                   :: Content.ContentID
    , title                     :: Title
    , buttonType                :: ButtonType
    , formAction                :: FormAction
    , options                   :: Maybe Options
} deriving (Show)

instance ToJSON Button where
    toJSON Button {..} = object
        [ "id" .= contentId
        , "type" .= Content.Button
        , "button_type" .= buttonType
        , "title" .= title
        , "options" .= options
        , "form_action" .= formAction
        ]
