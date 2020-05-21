{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.FlexOptions
    ( FlexOptions(..)
    )
where

import           Data.Aeson
import           Data.Text

data FlexOptions = FlexOptions {
    flexGrow                :: Maybe Double
    , flexBasis             :: Maybe Double
    , flexDirections        :: Maybe Text
    , flexWrap              :: Maybe Text
    , alignItems            :: Maybe Text
    , alignSelf             :: Maybe Text
    , justifyContent        :: Maybe Text
} deriving (Show)

instance ToJSON FlexOptions where
    toJSON FlexOptions {..} = object
        [ "flex_grow" .= flexGrow
        , "flex_basis" .= flexBasis
        , "flex_wrap" .= flexWrap
        , "align_items" .= alignItems
        , "align_self" .= alignSelf
        , "justify_content" .= justifyContent
        ]

