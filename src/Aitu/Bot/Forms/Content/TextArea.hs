{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.TextArea
    ( TextArea(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )

data TextArea = TextArea {
    contentId               :: Text
    , contentType           :: Text
    , title                 :: Maybe Text
    , text                  :: Maybe Text
    , placeholder           :: Maybe Text
    , validationRules       :: Maybe ValidationRules
    , options               :: Maybe Options
}
