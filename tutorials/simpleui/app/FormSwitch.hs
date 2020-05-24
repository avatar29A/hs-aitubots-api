{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormSwitch where

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
                        , title      = "FormSwitch Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        switch1 = Switch
            "switch1"
            "Are you accepted rules?"
            False
            (Just defaultOptions
                { indentOuter = Just Indent { left   = 30
                                            , right  = 30
                                            , top    = 50
                                            , bottom = 30
                                            }
                }
            )

        switch2 = Switch "switch2" "Are you accepted rules?" False Nothing

        form1   = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content switch1, C.Content switch2]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
