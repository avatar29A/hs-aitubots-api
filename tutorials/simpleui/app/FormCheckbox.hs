{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormCheckbox where

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
                        , title      = "FormCheckbox Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }
        checkbox1 = Checkbox { contentId       = "checkbox1"
                             , title           = "Checkbox 1"
                             , defaultState    = False
                             , validationRules = Nothing
                             , options         = Nothing
                             }
        checkbox2 = Checkbox
            { contentId       = "checkbox2"
            , title           = "Checkbox 2"
            , defaultState    = False
            , validationRules =
                Just
                    [ ValidationRule REQUIRED
                                     (Required True)
                                     "Field shouldn't be empty"
                    ]
            , options         = Nothing
            }
        checkbox3 = Checkbox
            { contentId       = "checkbox3"
            , title           = "Checkbox 3"
            , defaultState    = False
            , validationRules = Nothing
            , options = Just $ defaultOptions { textSize  = Just H1
                                              , textColor = Just "#FFEF00"
                                              }
            }

        submit = Button "submit"
                        "Submit"
                        DefaultButton
                        (FormAction SubmitFormAction EmptyTemplate)
                        Nothing
        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [ C.Content checkbox1
                          , C.Content checkbox2
                          , C.Content checkbox3
                          , C.Content submit
                          ]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
