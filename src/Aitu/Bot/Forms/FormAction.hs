module Aitu.Bot.Forms.FormAction (FormAction (..)) where

import Data.Text

data FormAction = FormAction {
    formActionAction            :: Text
    , formActionDataTemplate    :: Maybe Text
    , formActionHiddenMetadata  :: Maybe Text
}
