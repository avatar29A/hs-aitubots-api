{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormDatePicker where

import           Aitu.Bot
import           Aitu.Bot.Types
import           Aitu.Bot.Forms
import           Aitu.Bot.Commands
import           Aitu.Bot.Widgets

import qualified Aitu.Bot.Forms.Content.Content
                                               as C

open :: Peer -> AituBotClient ()
open peer = do
    let header = Header { headerType = TITLE
                        , title      = "FormDatePicker Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        datepicker1 = DatePicker
            "datepicker1"
            "Date title"
            (Just Date { day = 01, month = 01, year = 2019 })
            (Just
                [ ValidationRule REQUIRED
                                 (Required True)
                                 "This field is required"
                ]
            )
            (Just defaultOptions
                { minDate = Just Date { day = 01, month = 01, year = 2018 }
                , maxDate = Just Date { day = 01, month = 01, year = 2030 }
                }
            )

        submit = Button "submit"
                        "Submit"
                        DefaultButton
                        (FormAction SubmitFormAction EmptyTemplate)
                        Nothing
        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content datepicker1, C.Content submit]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
