{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormSubmit where

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
                        , title      = "FormSubmit Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }
        formAction = FormAction SendMessageAction (DataTemplate "Hi")

        submit     = Submit { contentId  = "submit1"
                            , formAction = formAction
                            , title      = "send me HI"
                            , options    = Nothing
                            }

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content submit]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
