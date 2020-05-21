{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.Button
    ( Button(..)
    )
where

import           Data.Text

import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.FormAction      ( FormAction )

data Button = Button {
    contentId                   :: Text
    , contentType               :: Text
    , buttonType                :: Maybe Text
    , title                     :: Maybe Text
    , options                   :: Maybe Options
    , formAction                :: Maybe FormAction
}
