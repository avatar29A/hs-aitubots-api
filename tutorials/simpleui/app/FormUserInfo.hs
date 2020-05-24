{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormUserInfo where

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
                        , title      = "FormUserInfo Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        userInfo = UserInfo { contentId = "userInfo", userId = "<USER_ID>" }

        form1    = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content userInfo]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
