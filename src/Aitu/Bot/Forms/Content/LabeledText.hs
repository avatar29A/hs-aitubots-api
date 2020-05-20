module Aitu.Bot.Forms.Content.LabeledText (LabeledText (..)) where

import Data.Text
import Aitu.Bot.Forms.Options (Options)

data LabeledText = LabeledText {
    labeledtextContentType          :: Text
    , labeledtextContentId          :: Text
    , labeledtextLabel              :: Text
    , labeledtextTitle              :: Text
    , labeledtextOptions            :: Maybe Text
}