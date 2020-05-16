
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.Commands (Commands (..)) where

import Data.Aeson
import Data.Text
import GHC.Generics

data Commands a where
    Commands :: ToJSON a => {commands :: [a]} -> Commands a

instance (ToJSON a) => ToJSON (Commands a) where
    toJSON command = object [
        "commands" .= commands command]
