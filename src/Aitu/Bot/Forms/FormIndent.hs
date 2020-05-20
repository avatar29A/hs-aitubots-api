module Aitu.Bot.Forms.FormIndent where

data FormIndent = FormIndent {
    indentLeft      :: Maybe Int
    , indentTop     :: Maybe Int
    , indentRight   :: Maybe Int
    , indentBottom  :: Maybe Int
}