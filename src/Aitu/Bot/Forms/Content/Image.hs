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
import           Aitu.Bot.Forms.Content.Content ( ContentType )

data Image = Image {
    contentId              :: Text
    , contentType          :: ContentType
    , fileMetadata         :: FileMetadata
    , options              :: Maybe Options
    , formAction           :: Maybe FormAction
}

instance ToJSON Image where
    toJSON Image {..} = object
        [ "id" .= contentId
        , "type" .= contentType
        , "file_metadata" .= fileMetadata
        , "options" .= options
        , "form_action" .= formAction
        ]
