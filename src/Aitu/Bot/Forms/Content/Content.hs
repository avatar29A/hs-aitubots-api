{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

module Aitu.Bot.Forms.Content.Content
    ( Content(..)
    , ContentType(..)
    , ContentID
    )
where

import           Data.Text
import           Data.Aeson

type ContentID = Text

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
                    | FormText
                    | CustomContainer

deriving instance Show ContentType

instance ToJSON ContentType where
    toJSON UserInfo        = String "user_info"
    toJSON TextArea        = String "text_area"
    toJSON RadioGroup      = String "radiogroup"
    toJSON MediaPicker     = String "media_picker"
    toJSON DatePicker      = String "date_picker"
    toJSON SimpleCatalog   = String "simple_catalog"
    toJSON LabeledText     = String "labeled_text"
    toJSON ItemButton      = String "item_button"
    toJSON ItemInfo        = String "item_info"
    toJSON BottomBar       = String "bottom_bar"
    toJSON FormText        = String "form_text"
    toJSON CustomContainer = String "custom_container"
    toJSON v               = String $ (toLower . pack . show) v

data Content where
    Content ::(ToJSON a, Show a) => a -> Content

instance ToJSON Content where
    toJSON (Content c) = toJSON c

deriving instance Show Content
