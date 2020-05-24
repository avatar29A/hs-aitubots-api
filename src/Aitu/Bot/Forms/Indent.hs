{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Indent
    ( Indent(..)
    )
where

import           Data.Aeson
import           Data.Text

type Left = Int
type Top = Int
type Right = Int
type Bottom = Int

data Indent = Indent {
    left      :: Int
    , top     :: Int
    , right   :: Int
    , bottom  :: Int
} deriving (Show)

instance ToJSON Indent where
    toJSON Indent {..} = object
        ["left" .= left, "right" .= right, "bottom" .= bottom, "top" .= top]
