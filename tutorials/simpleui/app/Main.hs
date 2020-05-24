{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Main where

import qualified Data.UUID                     as UUID
import           Data.Aeson              hiding ( defaultOptions )
import           Data.Maybe
import           Aitu.Bot
import           Aitu.Bot.Types

import           Network.HTTP.Client
import           Network.HTTP.Client.TLS        ( tlsManagerSettings )

import qualified Data.ByteString.Lazy.Char8    as BC

import qualified FormButton
import qualified FormButtonBar
import qualified FormCheckbox
import qualified FormDatePicker
import qualified FormImage
import qualified FormInput
import qualified FormItemInfo
import qualified FormLabeledText
import qualified FormMediaPicker
import qualified FormRadiogroup
import qualified FormSimpleCatalog
import qualified FormSwitch
import qualified FormSubmit
import qualified FormTextArea
import qualified FormUserInfo
import qualified FormText
import qualified FormCustomContainer

main :: IO ()
main = do
    let token = "567046be-9bee-4197-96ca-b41f9281c706"
        peerId =
            fromJust (UUID.fromString "fe909ae9-b048-11e8-81c3-0242c0a88006")
        peer = mkUserWithDefaults peerId

    manager  <- newManager tlsManagerSettings
    response <- runAituBotClient token manager $ FormCustomContainer.open peer

    case response of
        Left  (code, errMsg) -> BC.putStrLn errMsg
        Right val            -> print val
