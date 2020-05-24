{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormCustomContainer where

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
                        , title      = "FormCustomContainer Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        contactTitleText = TextWidget
            { contentId  = "contactTitleText"
            , title      = "Контактный телефон:"
            , formAction = Nothing
            , options    = Just defaultOptions
                { textSize    = Just H4
                , textColor   = Just "#A9ADB1"
                , indentOuter = Just Indent { left   = 12
                                            , top    = 2
                                            , right  = 12
                                            , bottom = 0
                                            }
                }
            }

        contactNumberText = TextWidget
            { contentId  = "contactNumberText"
            , title      = "+7 (727) 332-77-22"
            , formAction = Nothing
            , options    = Just defaultOptions
                { textSize    = Just H3
                , textStyle   = Just BOLD
                , indentOuter = Just Indent { left   = 12
                                            , top    = 4
                                            , right  = 12
                                            , bottom = 12
                                            }
                }
            }

        divider = Divider
            "divider"
            (Just defaultOptions
                { indentOuter = Just Indent { left   = 12
                                            , top    = 14
                                            , right  = 12
                                            , bottom = 0
                                            }
                }
            )

        titleText = TextWidget
            { contentId  = "titleText"
            , title      = "Евразийский банк"
            , formAction = Nothing
            , options    = Just defaultOptions
                { textSize    = Just H3
                , textStyle   = Just BOLD
                , indentOuter = Just Indent { left   = 12
                                            , top    = 12
                                            , right  = 12
                                            , bottom = 0
                                            }
                }
            }

        subtitleText = TextWidget
            { contentId  = "subtitleText"
            , title      = "eubank.kz"
            , formAction = Just $ FormAction
                               OpenUrlAction
                               (DataTemplate "https://eubank.kz")
            , options    = Just defaultOptions
                { textSize    = Just H4
                , alignment   = Just RIGHT
                , textColor   = Just "#0075EB"
                , indentOuter = Just Indent { left   = 12
                                            , top    = 2
                                            , right  = 12
                                            , bottom = 0
                                            }
                }
            }

        parentCustomContainer = CustomContainer
            { contentId = "parentContainer"
            , content   = [ C.Content titleText
                          , C.Content subtitleText
                          , C.Content divider
                          , C.Content contactTitleText
                          , C.Content contactNumberText
                          ]
            , options   = Just defaultOptions
                { width       = Just 62
                , flexOptions = Just defaultFlexOptions
                                    { flexDirection = Just COLUMN
                                    , alignItems    = Just ALIGN_START
                                    }
                }
            }

        mainCustomContainer = CustomContainer
            { contentId = "mainContainer"
            , content   = [C.Content parentCustomContainer]
            , options   = Just defaultOptions
                              { indentOuter = Just Indent { left   = 16
                                                          , right  = 16
                                                          , top    = 8
                                                          , bottom = 8
                                                          }
                              , background  = Just "card"
                              }
            }


    sendCustomContainer peer [mainCustomContainer]
