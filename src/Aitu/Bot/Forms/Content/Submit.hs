{-# LANGUAGE DuplicateRecordFields #-}
module Aitu.Bot.Forms.Content.Submit
    ( Submit(..)
    )
where

import           Data.Text
import           Aitu.Bot.Forms.Options         ( Options )
import           Aitu.Bot.Forms.FormAction      ( FormAction )

data Submit = Submit {
    contentId         :: Text
    , contentType     :: Text
    , title           :: Text
    , formAction      :: FormAction
    , options         :: Maybe Options
}
