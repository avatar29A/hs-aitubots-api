{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Image
    ( Image(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )
import           Aitu.Bot.Forms.FormAction      ( FormAction )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data Image = Image {
    contentId              :: Content.ContentID
    , fileMetadata         :: FileMetadata
    , options              :: Maybe Options
    , formAction           :: Maybe FormAction
} deriving (Show)

instance ToJSON Image where
    toJSON Image {..} = object
        [ "id" .= contentId
        , "type" .= Content.Image
        , "file_metadata" .= fileMetadata
        , "options" .= options
        , "form_action" .= formAction
        ]
