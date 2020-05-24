{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormImage where

import           Aitu.Bot
import           Aitu.Bot.Types          hiding ( Image(..)
                                                , InputMediaType(..)
                                                )
import           Aitu.Bot.Forms
import           Aitu.Bot.Commands
import           Aitu.Bot.Widgets

import qualified Aitu.Bot.Forms.Content.Content
                                               as C

open :: Peer -> AituBotClient ()
open peer = do
    let header = Header { headerType = TOOLBAR
                        , title      = "FormImage Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        fileMetadata = FileMetadata "image_id" IMAGE "file_name.jpg"

        image1       = Image
            "image_id"
            fileMetadata
            (Just defaultOptions { width = Just 100, height = Just 100 })
            Nothing

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content image1]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
