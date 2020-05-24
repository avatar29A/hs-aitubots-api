{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormButton where

import           Aitu.Bot
import           Aitu.Bot.Types
import           Aitu.Bot.Forms
import           Aitu.Bot.Commands
import           Aitu.Bot.Widgets

import qualified Aitu.Bot.Forms.Content.Content
                                               as C

open :: Peer -> AituBotClient ()
open peer = do
    let
        form = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = Header { headerType = TOOLBAR
                                 , title      = "FormButton Example"
                                 , options    = defaultHeaderOptions
                                 , formAction = Nothing
                                 }
            , content   = [ C.Content $ Button
                                "Open ya.ru"
                                "button_1"
                                DefaultButton
                                (FormAction OpenUrlAction
                                            (DataTemplate "http://ya.ru")
                                )
                                Nothing
                          ]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form
