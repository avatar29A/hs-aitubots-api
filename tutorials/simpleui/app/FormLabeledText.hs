{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormLabeledText where

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
                        , title      = "FormLabeledText Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        labeledText1 = LabeledText
            "labeled_text_id"
            "Some short label"
            "Label text. It Has fixed decoration"
            (Just defaultOptions
                { indentInner = Just Indent { right  = 5
                                            , top    = 5
                                            , bottom = 10
                                            , left   = 0
                                            }
                }
            )

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content labeledText1]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
