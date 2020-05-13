module Aitu.Bot.Types.Aliases (
    Url
    , Token
    , HttpCode
) where

import qualified Data.ByteString as BS

type Url = String
type Token = BS.ByteString
type HttpCode = Int