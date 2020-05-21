module Aitu.Bot.Forms.ValidationRules (
    ValidationRules
    , ValidationRule (..)) where

import Data.Text

type ValidationRules = [ValidationRule]

data ValidationRule = ValidationRule {
    validateRuleType        :: Text
    , validateRuleValue     :: Text
    , validateRuleError     :: Text
}