{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Options
    ( Options(..)
    , Alignment(..)
    , Currency(..)
    , InputType(..)
    , MediaType(..)
    , Orientation(..)
    , TextSize(..)
    , TextStyle(..)
    , DateType(..)
    , CatalogType(..)
    , CatalogItemType(..)
    , defaultOptions
    , defaultHeaderOptions
    )
where

import           Data.Aeson              hiding ( Options
                                                , defaultOptions
                                                )
import           Data.Text               hiding ( take )
import           Aitu.Bot.Forms.FlexOptions     ( FlexOptions )
import           Aitu.Bot.Forms.Indent          ( Indent )

--
-- DateType
data DateType = Date {
    day :: Int
    , month :: Int
    , year :: Int
} deriving (Show)

instance ToJSON DateType where
    toJSON Date {..} =
        String $ pack $ show day ++ "-" ++ show month ++ "-" ++ show year

--
-- Alignment
data Alignment = LEFT | RIGHT | CENTRAL

instance Show Alignment where
    show LEFT    = "left"
    show RIGHT   = "right"
    show CENTRAL = "center_horizontal"

instance ToJSON Alignment where
    toJSON align = String $ (pack . show) align

--
-- Currency
data Currency = KZT | USD | RUB | EUR | GBP deriving (Show)

instance ToJSON Currency where
    toJSON currency = String $ (pack . show) currency

--
-- InputType
data InputType = DOUBLE | TEXT | NUMBER | MONEY

instance ToJSON InputType where
    toJSON inputType = String $ (pack . show) inputType

instance Show InputType where
    show DOUBLE = "double"
    show TEXT   = "text"
    show NUMBER = "number"
    show MONEY  = "money"

--
-- MediaType
data MediaType = PHOTO | VIDEO | IMAGE | AUDIO | DOCUMENT

instance ToJSON MediaType where
    toJSON mediaType = String $ (pack . show) mediaType

instance Show MediaType where
    show PHOTO    = "photo"
    show VIDEO    = "video"
    show IMAGE    = "image"
    show AUDIO    = "audio"
    show DOCUMENT = "document"

--
-- Orientation Type
data Orientation = VERTICAL | HORIZONTAL

instance ToJSON Orientation where
    toJSON orientation = String $ (pack . show) orientation

instance Show Orientation where
    show VERTICAL   = "vertical"
    show HORIZONTAL = "horizontal"

--
-- TextSize Type
data TextSize = H1 | H2 | H3 | H4 deriving (Show)

instance ToJSON TextSize where
    toJSON textSize = String $ (pack . show) textSize

--
-- TextStyle Type
data TextStyle = NORMAL | BOLD

instance Show TextStyle where
    show NORMAL = "normal"
    show BOLD   = "bold"

instance ToJSON TextStyle where
    toJSON textStyle = String $ (pack . show) textStyle

--
-- SimpleCatalog types
data CatalogType = CatalogGrid | CatalogList | CatalogHorizontalList deriving (Show)

instance ToJSON CatalogType where
    toJSON CatalogGrid           = String "grid"
    toJSON CatalogList           = String "list"
    toJSON CatalogHorizontalList = String "horizontal_list"

data CatalogItemType = CatalogItemCard | CatalogItemInfo | CatalogItemBulleted | CatalogItemNumbered | CatalogItemNumberedBracket deriving (Show)

instance ToJSON CatalogItemType where
    toJSON CatalogItemCard            = String "item_card"
    toJSON CatalogItemInfo            = String "item_info"
    toJSON CatalogItemBulleted        = String "item_bulleted"
    toJSON CatalogItemNumbered        = String "item_numbered"
    toJSON CatalogItemNumberedBracket = String "item_numbered_bracket"

--
-- Option

data Options = Options {
    catalogType                   :: Maybe CatalogType
    , catalogItemType             :: Maybe CatalogItemType
    , alignment                   :: Maybe Alignment
    , background                  :: Maybe Text
    , backgroundColor             :: Maybe Text
    , choiceType                  :: Maybe Text
    , closeable                   :: Maybe Bool
    , columnsCount                :: Maybe Int
    , currency                    :: Maybe Currency
    , dividerType                 :: Maybe Text
    , flexOptions                 :: Maybe FlexOptions
    , fullscreen                  :: Maybe Bool
    , hasBackAction               :: Maybe Bool
    , height                      :: Maybe Int
    , indentInner                 :: Maybe Indent
    , indentOuter                 :: Maybe Indent
    , inputType                   :: Maybe InputType
    , itemLeftIconResource        :: Maybe Text
    , itemRightIconResource       :: Maybe Text
    , maxCount                    :: Maybe Int
    , maxLength                   :: Maybe Int
    , mediaType                   :: Maybe MediaType
    , orientation                 :: Maybe Orientation
    , searchEnabled               :: Maybe Bool
    , showDivider                 :: Maybe Bool
    , shape                       :: Maybe Text
    , shouldOpenEditor            :: Maybe Bool
    , subtitleLinesCount          :: Maybe Int
    , textColor                   :: Maybe Text
    , textSize                    :: Maybe TextSize
    , textStyle                   :: Maybe TextStyle
    , title                       :: Maybe Text
    , titleLinesCount             :: Maybe Int
    , width                       :: Maybe Int
    , minDate                     :: Maybe DateType
    , maxDate                     :: Maybe DateType
} deriving (Show)

instance ToJSON Options where
    toJSON Options {..} = object
        [ "type" .= catalogType
        , "item_type" .= catalogItemType
        , "fullscreen" .= fullscreen
        , "title" .= title
        , "columns_count" .= columnsCount
        , "search_enabled" .= searchEnabled
        , "closeable" .= closeable
        , "media_type" .= mediaType
        , "choice_type" .= choiceType
        , "text_size" .= textSize
        , "max_count" .= maxCount
        , "max_length" .= maxLength
        , "text_style" .= textStyle
        , "text_color" .= textColor
        , "width" .= width
        , "height" .= height
        , "show_divider" .= showDivider
        , "item_right_icon_resource" .= itemRightIconResource
        , "item_left_icon_resource" .= itemLeftIconResource
        , "shape" .= shape
        , "indent_inner" .= indentInner
        , "indent_outer" .= indentOuter
        , "input_type" .= inputType
        , "should_open_editor" .= shouldOpenEditor
        , "flex_options" .= flexOptions
        , "background_color" .= backgroundColor
        , "background" .= background
        , "alignment" .= alignment
        , "divider_type" .= dividerType
        , "has_back_action" .= hasBackAction
        , "orientation" .= orientation
        , "currency" .= currency
        , "min_date" .= minDate
        , "max_date" .= maxDate
        ]


defaultOptions :: Options
defaultOptions = Options Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing
                         Nothing

defaultHeaderOptions :: Options
defaultHeaderOptions = defaultOptions { closeable = Just True }
