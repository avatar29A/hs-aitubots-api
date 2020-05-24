{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormInput where

import           Aitu.Bot
import           Aitu.Bot.Types
import           Aitu.Bot.Forms
import           Aitu.Bot.Commands
import           Aitu.Bot.Widgets

import qualified Aitu.Bot.Forms.Content.Content
                                               as C

open :: Peer -> AituBotClient ()
open peer = do
    let header = Header { headerType = TOOLBAR
                        , title      = "FormInput Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        moneyInput = Input
            "moneyInput"
            "Input 1"
            (Just "Enter here")
            Nothing
            Nothing
            (Just
                [ ValidationRule REQUIRED
                                 (Required True)
                                 "This field is required"
                ]
            )
            (Just defaultOptions { inputType = Just MONEY, currency = Just KZT }
            )

        doubleInput = Input
            "doubleInput"
            "Input Double"
            (Just "Enter here")
            Nothing
            Nothing
            (Just
                [ ValidationRule REQUIRED
                                 (Required True)
                                 "This field is required"
                ]
            )
            (Just defaultOptions { inputType = Just DOUBLE })


        numberInput = Input
            "numberInput"
            "Number Double"
            (Just "Enter here")
            Nothing
            Nothing
            (Just
                [ ValidationRule REQUIRED
                                 (Required True)
                                 "This field is required"
                ]
            )
            (Just defaultOptions { inputType = Just NUMBER })

        textInput = Input
            "textInput"
            "Text Input"
            (Just "Enter here")
            Nothing
            Nothing
            (Just
                [ ValidationRule REQUIRED
                                 (Required True)
                                 "This field is required"
                ]
            )
            (Just defaultOptions { inputType = Just TEXT })

        submit = Button
            "submit"
            "Submit"
            DefaultButton
            (FormAction
                SendMessageAction
                (DataTemplate
                    "Data:\nMoney:{form1.moneyInput}\nDouble:{form1.doubleInput}\nnumberInput:{form1.numberInput}\nText:{form1.textInput}"
                )
            )
            Nothing

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [ C.Content moneyInput
                          , C.Content doubleInput
                          , C.Content numberInput
                          , C.Content textInput
                          , C.Content submit
                          ]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
