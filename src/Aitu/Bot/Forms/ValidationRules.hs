{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.ValidationRules
    ( ValidationRuleType(..)
    , ValidationRuleValue(..)
    , ValidationRules
    , ValidationRule(..)
    )
where

import           Data.Aeson
import           Data.Text

data ValidationRuleType = REQUIRED | MAX_LENGTH | MIN_LENGTH | MIN_COUNT | MIN | MAX deriving (Show)

instance ToJSON ValidationRuleType where
    toJSON ty = String $ (toLower . pack . show) ty

data ValidationRuleValue = Required Bool | MinMax Int | Length Int | Count Int deriving (Show)

instance ToJSON ValidationRuleValue where
    toJSON (Required b) = String $ (toLower . pack . show) b
    toJSON (MinMax   v) = String $ (pack . show) v
    toJSON (Length l) =
        let fixedLength = if l < 0 then 0 else l
        in  String $ (pack . show) fixedLength

    toJSON (Count c) = String $ (pack . show) c

type ValidationRules = [ValidationRule]

data ValidationRule = ValidationRule {
    validateRuleType        :: ValidationRuleType
    , value                 :: ValidationRuleValue
    , error                 :: Text
} deriving (Show)

instance ToJSON ValidationRule where
    toJSON ValidationRule {..} =
        object ["type" .= validateRuleType, "value" .= value, "error" .= error]
