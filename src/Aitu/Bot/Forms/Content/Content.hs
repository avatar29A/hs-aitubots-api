{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Content
    ( Content(..)
    , ContentType(..)
    )
where

import           Data.Text
import           Data.Aeson

data ContentType = Button
                    | Divider
                    | BottomBar
                    | Image
                    | ItemInfo
                    | LabeledText
                    | SimpleCatalog
                    | DatePicker
                    | Checkbox
                    | Text
                    | Input
                    | Item
                    | ItemButton
                    | MediaPicker
                    | RadioGroup
                    | Slider
                    | Submit
                    | Switch
                    | TextArea
                    | UserInfo

deriving instance Show ContentType

instance ToJSON ContentType where
    toJSON UserInfo      = String "user_info"
    toJSON TextArea      = String "text_area"
    toJSON RadioGroup    = String "radio_group"
    toJSON MediaPicker   = String "media_picker"
    toJSON DatePicker    = String "date_picker"
    toJSON SimpleCatalog = String "simple_catalog"
    toJSON LabeledText   = String "labeled_text"
    toJSON ItemButton    = String "item_button"
    toJSON ItemInfo      = String "item_info"
    toJSON BottomBar     = String "bottom_bar"
    toJSON v             = String $ (toLower . pack . show) v

data Content where
    Content ::(ToJSON a, Show a) => a -> Content

instance ToJSON Content where
    toJSON (Content c) = toJSON c

deriving instance Show Content
