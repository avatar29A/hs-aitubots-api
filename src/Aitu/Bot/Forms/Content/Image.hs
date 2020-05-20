module Aitu.Bot.Forms.Content.Image (Image (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)
import Aitu.Bot.Forms.Content.FileMetadata (FileMetadata)
import Aitu.Bot.Forms.FormAction (FormAction)

data Image = Image {
    imageContentId              :: Text
    , imageContentType          :: Text
    , imageFileMetadata         :: FileMetadata
    , imageOptions              :: Maybe Options
    , imageFormAction           :: Maybe FormAction
}