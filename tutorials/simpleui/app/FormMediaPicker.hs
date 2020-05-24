{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormMediaPicker where

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
                        , title      = "FormMediaPicker Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        mediaPickerImage = MediaPicker
            { contentId       = "media_picker_image_id"
            , title           = "Image media picker title"
            , validationRules = Just
                [ValidationRule MIN_COUNT (Count 1) "Выберите хотя бы 1 файл"]
            , options         = Just defaultOptions { mediaType = Just PHOTO
                                                    , height    = Just 20
                                                    , width     = Just 80
                                                    , maxCount  = Just 2
                                                    }
            }

        mediaPickerVideo = MediaPicker
            { contentId       = "media_picker_video_id"
            , title           = "Video media picker title"
            , validationRules = Just
                [ValidationRule MIN_COUNT (Count 1) "Выберите хотя бы 1 файл"]
            , options = Just defaultOptions { mediaType        = Just VIDEO
                                            , height           = Just 20
                                            , width            = Just 80
                                            , maxCount         = Just 2
                                            , shouldOpenEditor = Just False
                                            }
            }

        submit = Button "submit"
                        "Submit"
                        DefaultButton
                        (FormAction SubmitFormAction EmptyTemplate)
                        Nothing

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [ C.Content mediaPickerImage
                          , C.Content mediaPickerVideo
                          , C.Content submit
                          ]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
