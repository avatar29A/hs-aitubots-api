{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.FormText
    ( FormText(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.FormAction      ( FormAction )

data FormText = FormText {
    contentId               :: Text
    , contentType           :: Text
    , title                 :: Text
    , options               :: Maybe Options
    , formAction            :: Maybe FormAction
}
