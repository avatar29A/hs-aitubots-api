{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormText where

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
                        , title      = "FormText Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        text1 = TextWidget
            { contentId  = "text1"
            , title      = "New test text for show before divider"
            , formAction = Nothing
            , options    = Just defaultOptions
                { textSize    = Just H1
                , textStyle   = Just BOLD
                , textColor   = Just "#000000"
                , indentInner = Just Indent { right  = 5
                                            , top    = 5
                                            , bottom = 10
                                            , left   = 0
                                            }
                }
            }

        text2 = TextWidget
            { contentId  = "text2"
            , title      = "New test text for show after divider"
            , formAction = Nothing
            , options    = Just defaultOptions
                { textSize    = Just H3
                , textColor   = Just "#442B83"
                , indentInner = Just Indent { right  = 10
                                            , top    = 10
                                            , bottom = 1
                                            , left   = 0
                                            }
                }
            }

        divider = Divider "dividerid" Nothing

        form1   = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content text1, C.Content divider, C.Content text2]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
