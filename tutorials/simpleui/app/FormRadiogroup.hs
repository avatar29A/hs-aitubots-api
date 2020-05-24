{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormRadiogroup where

import           Aitu.Bot
import           Aitu.Bot.Types          hiding ( InputMediaType(..) )
import           Aitu.Bot.Forms
import           Aitu.Bot.Commands
import           Aitu.Bot.Widgets

import qualified Aitu.Bot.Forms.Content.Content
                                               as C

open :: Peer -> AituBotClient ()
open peer = do
    let header = Header { headerType = TOOLBAR
                        , title      = "FormRadiogroup Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        radiogroup1 = RadioGroup
            { contentId = "radiogroup_id"
            , title = "Radio Group"
            , items = [RadioItem "item1" "Item 1", RadioItem "item2" "Item 2"]
            , defaultValue = Nothing
            , validationRules = Just
                [ValidationRule REQUIRED (Required True) "Have to fill it!"]
            , options = Just defaultOptions { orientation = Just HORIZONTAL }
            }

        submit = Button "submit"
                        "Submit"
                        DefaultButton
                        (FormAction SubmitFormAction EmptyTemplate)
                        Nothing

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content radiogroup1, C.Content submit]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
