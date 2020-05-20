module Aitu.Bot.Forms.Options (
    Options (..)
    , Alignment (..)
    , Currency  (..)
    , InputType (..)
    , OptionMediaType (..)
    , Orientation (..)
    , TextSize (..)
    , TextStyle (..)
    ) where

import Data.Text
import Aitu.Bot.Forms.FlexOptions (FlexOptions)
import Aitu.Bot.Forms.FormIndent (FormIndent)

data Alignment = LEFT | RIGHT | CENTRAL

instance Show Alignment where
    show LEFT       = "left"
    show RIGHT      = "right"
    show CENTRAL    = "center_horizontal"

data Currency = KZT | USD | RUB | EUR | GBP deriving (Show)

data InputType = DOUBLE | TEXT | NUMBER | MONEY

instance Show InputType where
    show DOUBLE     = "double"
    show TEXT       = "text"
    show NUMBER     = "number"
    show MONEY      = "money"

data OptionMediaType = PHOTO | VIDEO

instance Show OptionMediaType where
    show PHOTO      = "photo"
    show VIDEO      = "video"

data Orientation = VERTICAL | HORIZONTAL

instance Show Orientation where
    show VERTICAL   = "vertical"
    show HORIZONTAL = "horizontal"

data TextSize = H1 | H2 | H3 | H4 deriving (Show)

data TextStyle = NORMAL | BOLD

instance Show TextStyle where
    show NORMAL     = "normal"
    show BOLD       = "bold"


data Options = Options {
    optionsType                          :: Maybe Text
    , optionsAlignment                   :: Maybe Alignment
    , optionsBackground                  :: Maybe Text
    , optionsBackgroundColor             :: Maybe Text
    , optionsChoiceType                  :: Maybe Text
    , optionsCloseable                   :: Maybe Bool
    , optionsColumnsCount                :: Maybe Int
    , optionsCurrency                    :: Maybe Currency
    , optionsDividerType                 :: Maybe Text
    , optionsFlexOptions                 :: Maybe FlexOptions
    , optionsFullscreen                  :: Maybe Bool
    , optionsHasBackAction               :: Maybe Bool
    , optionsHeight                      :: Maybe Int
    , optionsIndentInner                 :: Maybe FormIndent
    , optionsIndentOuter                 :: Maybe FormIndent
    , optionsInputType                   :: Maybe InputType
    , optionsItemLeftIconResource        :: Maybe Text
    , optionsItemRightIconResource       :: Maybe Text
    , optionsItemType                    :: Maybe Text
    , optionsMaxCount                    :: Maybe Int
    , optionsMaxDate                     :: Maybe Text
    , optionsMaxLength                   :: Maybe Int
    , optionsMediaType                   :: Maybe OptionMediaType
    , optionsOrientation                 :: Maybe Orientation
    , optionsSearchEnabled               :: Maybe Bool
    , optionsShowDivider                 :: Maybe Bool
    , optionsShape                       :: Maybe Text
    , optionsShouldOpenEditor            :: Maybe Bool
    , optionsSubtitleLinesCount          :: Maybe Int
    , optionsTextColor                   :: Maybe Text
    , optionsTextSize                    :: Maybe TextSize
    , optionsTextStyle                   :: Maybe TextStyle
    , optionsTitle                       :: Maybe Text
    , optionsTitleLinesCount             :: Maybe Int
    , optionsWidth                       :: Maybe Int
}