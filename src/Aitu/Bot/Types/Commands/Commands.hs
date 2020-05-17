
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Types.Commands.Commands (Commands (..)) where

import Data.Aeson

-- Commands is a wrapper to gethering several command to an one batch
-- commands : [command1, command2, ... etc]
data Commands a where
    Commands :: ToJSON a => {commands :: [a]} -> Commands a

instance (ToJSON a) => ToJSON (Commands a) where
    toJSON command = object [
        "commands" .= commands command]
