{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormTextArea where

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
                        , title      = "FormTextArea Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }
        textArea1 = TextArea
            { contentId       = "textArea1"
            , title           = "Text Area"
            , text            = ""
            , placeholder     = Just "Enter your text here"
            , validationRules =
                Just
                    [ ValidationRule REQUIRED
                                     (Required True)
                                     "You mast fill this area"
                    ]
            , options         = Nothing
            }

        submit = Submit
            { contentId  = "submit1"
            , formAction = FormAction SendMessageAction
                                      (DataTemplate "{form1.textArea1}")
            , title      = "send me HI"
            , options    = Nothing
            }

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content textArea1, C.Content submit]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
