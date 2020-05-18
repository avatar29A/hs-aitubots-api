{-# LANGUAGE GADTs #-}
module Aitu.Bot.Forms.FormContent (FormContent (..)) where

import Data.Aeson

data FormContent where
    FromList    :: (ToJSON a) => [a] -> FormContent
    FromObject  :: (ToJSON a) => a -> FormContent