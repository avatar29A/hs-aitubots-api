{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.FlexOptions
    ( FlexOptions(..)
    , FlexDirection(..)
    , FlexWrap(..)
    , FlexAlign(..)
    , FlexJustifyContent(..)
    , defaultFlexOptions
    )
where

import           Data.Aeson
import           Data.Text

--
-- FlexDirection
data FlexDirection = ROW | COLUMN deriving (Show)

instance ToJSON FlexDirection where
    toJSON ROW    = String "row"
    toJSON COLUMN = String "column"

--
-- FlexWrap
data FlexWrap = WRAP | NOWRAP | REVERSE deriving (Show)

instance ToJSON FlexWrap where
    toJSON WRAP    = String "wrap"
    toJSON NOWRAP  = String "nowrap"
    toJSON REVERSE = String "wrap-reverse"

--
-- FlexAlignItems

data FlexAlign = ALIGN_START
                    | ALIGN_END
                    | ALIGN_CENTER
                    | ALIGN_BASELINE
                    | ALIGN_STRETCH deriving (Show)

instance ToJSON FlexAlign where
    toJSON ALIGN_START    = "start"
    toJSON ALIGN_END      = "end"
    toJSON ALIGN_CENTER   = "center"
    toJSON ALIGN_BASELINE = "baseline"
    toJSON ALIGN_STRETCH  = "stretch"

--
-- FlexJustify

data FlexJustifyContent = JUSTIFY_START
                            | JUSTIFY_END
                            | JUSTIFY_CENTER
                            | JUSTIFY_SPACE_BETWEEN
                            | JUSTIFY_SPACE_AROUND
                            | JUSTIFY_SPACE_EVENLY deriving (Show)

instance ToJSON FlexJustifyContent where
    toJSON JUSTIFY_START         = String "start"
    toJSON JUSTIFY_END           = String "end"
    toJSON JUSTIFY_CENTER        = String "center"
    toJSON JUSTIFY_SPACE_BETWEEN = String "space-between"
    toJSON JUSTIFY_SPACE_AROUND  = String "space-around"
    toJSON JUSTIFY_SPACE_EVENLY  = String "space-evenly"

--
-- FlexOptions
data FlexOptions = FlexOptions {
    flexGrow                :: Maybe Double
    , flexBasis             :: Maybe Double
    , flexDirection        :: Maybe FlexDirection
    , flexWrap              :: Maybe FlexWrap
    , alignItems            :: Maybe FlexAlign
    , alignSelf             :: Maybe FlexAlign
    , justifyContent        :: Maybe FlexJustifyContent
} deriving (Show)

instance ToJSON FlexOptions where
    toJSON FlexOptions {..} = object
        [ "flex_grow" .= flexGrow
        , "flex_basis" .= flexBasis
        , "flex_direction" .= flexDirection
        , "flex_wrap" .= flexWrap
        , "align_items" .= alignItems
        , "align_self" .= alignSelf
        , "justify_content" .= justifyContent
        ]

defaultFlexOptions :: FlexOptions
defaultFlexOptions = FlexOptions { flexGrow       = Nothing
                                 , flexBasis      = Nothing
                                 , flexDirection  = Just ROW
                                 , flexWrap       = Nothing
                                 , alignItems     = Nothing
                                 , alignSelf      = Nothing
                                 , justifyContent = Nothing
                                 }
