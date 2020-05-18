module Aitu.Bot.Types.Errors (
    ClientError
    , stringToClientError
    , coerceToClientError
    , coerceEitherStringToEitherCE
    ) where

import qualified Data.ByteString.Lazy.Char8 as BC

type HttpCode = Int

type ClientError = (HttpCode, BC.ByteString)

stringToClientError :: String -> ClientError
stringToClientError s = (500, BC.pack s)

coerceToClientError :: (e -> ClientError) -> Either e r -> Either ClientError r
coerceToClientError f either = case either of
    Left msg -> Left $ f msg
    Right r -> Right r

coerceEitherStringToEitherCE :: Either String r -> Either ClientError r
coerceEitherStringToEitherCE = coerceToClientError stringToClientError