{-# LANGUAGE DuplicateRecordFields #-}

module Aitu.Bot.Forms.Content.Input
    ( Input(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.ValidationRules ( ValidationRules )

data Input = Input {
    contentId                  :: Text
    , contentType              :: Text
    , placeholder              :: Maybe Text
    , mask                     :: Maybe Text
    , text                     :: Maybe Text
    , options                  :: Maybe Options
    , validationRules          :: Maybe ValidationRules
}
