{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.Image
    ( Image(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.Content.FileMetadata
                                                ( FileMetadata )
import           Aitu.Bot.Forms.FormAction      ( FormAction )

data Image = Image {
    contentId              :: Text
    , contentType          :: Text
    , fileMetadata         :: FileMetadata
    , options              :: Maybe Options
    , formAction           :: Maybe FormAction
}
