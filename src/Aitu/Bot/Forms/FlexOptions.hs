module Aitu.Bot.Forms.FlexOptions (FlexOptions (..)) where

import Data.Text

data FlexOptions = FlexOptions {
    flexGrow                :: Maybe Double
    , flexBasis             :: Maybe Double
    , flexDirections        :: Maybe Text
    , flexWrap              :: Maybe Text
    , alignItems            :: Maybe Text
    , alignSelf             :: Maybe Text
    , justifyContent        :: Maybe Text
}