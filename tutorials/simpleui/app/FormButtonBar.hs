{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormButtonBar where

import           Aitu.Bot
import           Aitu.Bot.Types
import           Aitu.Bot.Forms
import           Aitu.Bot.Commands
import           Aitu.Bot.Widgets

import qualified Aitu.Bot.Forms.Content.Content
                                               as C

open :: Peer -> AituBotClient ()
open peer = do
    let form2 = mkEmptyForm
        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = Header { headerType = TITLE
                                 , title      = "FormBottomBar Example"
                                 , options    = defaultOptions
                                 , formAction = Nothing
                                 }
            , content   = []
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Just
                          $ BottomBar "bottom_bar_id" "Bottomm Bar"
                          $ FormAction
                                { action       = SendMessageAction
                                , dataTemplate = DataTemplate
                                                     "Message from bottom bar"
                                }
            }

    sendForm peer form1
