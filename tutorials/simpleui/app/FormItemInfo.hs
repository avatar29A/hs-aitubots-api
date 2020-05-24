{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormItemInfo where

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
                        , title      = "FormItemInfo Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        itemInfo1 = ItemInfo
            { contentId    = "item_info_id"
            , title        = Just "Item info title"
            , subtitle     = Just "Subtitle for item info"
            , fileMetadata = Nothing
            , options      = Just defaultOptions { titleLinesCount    = Just 2
                                                 , subtitleLinesCount = Just 3
                                                 }
            }

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content itemInfo1]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
