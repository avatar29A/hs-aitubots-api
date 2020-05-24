{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.CustomContainer
    ( CustomContainer(..)
    )
where

import           Data.Aeson              hiding ( Options )
import           Data.Text

import           Aitu.Bot.Forms.Options         ( Options
                                                , DateType
                                                )
import qualified Aitu.Bot.Forms.Content.Content
                                               as Content

data CustomContainer = CustomContainer {
    contentId                 :: Content.ContentID
    , content                 :: [Content.Content]
    , options                 :: Maybe Options
} deriving (Show)

instance ToJSON CustomContainer where
    toJSON CustomContainer {..} = object
        [ "id" .= contentId
        , "type" .= Content.CustomContainer
        , "content" .= content
        , "options" .= options
        ]
