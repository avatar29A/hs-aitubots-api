{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormSimpleCatalog where

import qualified Data.Text                     as T

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
                        , title      = "FormSimpleCatalog Example"
                        , options    = defaultHeaderOptions
                        , formAction = Nothing
                        }

        simpleCatalogItems = map
            (\n -> SimpleCatalogItem
                { itemId       = T.pack $ "item_id_" ++ show n
                , title        = T.pack $ "item_title_" ++ show n
                , subtitle     = T.pack $ "item_subtitle_" ++ show n
                , description  = Nothing
                , action       = Nothing
                , buttons      = Nothing
                , fileMetadata = Nothing
                , options      = Nothing
                }
            )
            [1 .. 20]

        simpleCatalog = SimpleCatalog
            { contentId = "simplecatalog_id"
            , items     = simpleCatalogItems
            , options   = Just defaultOptions
                              { catalogType           = Just CatalogList
                              , catalogItemType       = Just CatalogItemCard
                              , columnsCount          = Just 2
                              , showDivider           = Just True
                              , itemRightIconResource = Just "ic_right_arrow"
                              }
            }

        form1 = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = header
            , content   = [C.Content simpleCatalog]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form1
