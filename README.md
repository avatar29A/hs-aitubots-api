# hs-aitubots-api

![Build Status](https://img.shields.io/circleci/project/avatar29A/hs-aitubots-api.svg)
![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)
![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)

High-level bindings to the Aitu Bot API based on mtl style.

## Usage

We are support mtl-style way to using Aitu Bot API. Is a based on `AituBotClient` which is just `ReaderT` monad.

Documentation: https://btsdigital.github.io/bot-api-contract/

### getMe

```haskell
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.HTTP.Client
import Network.HTTP.Client.TLS (tlsManagerSettings)

import qualified Data.ByteString.Lazy.Char8 as BC

import Aitu.Bot

main :: IO ()
main = do
    let token = "<YOUR_BOT_TOKEN>"

    manager <- newManager tlsManagerSettings
    response <- runAituBotClient token manager $ do 
        getMe

    case response of
        Left (code, errMsg) -> BC.putStrLn errMsg
        Right me -> print me
```

### UI

Simple Form with Button, that open url by click

```hs
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

module FormButton where

import           Aitu.Bot
import           Aitu.Bot.Types
import           Aitu.Bot.Forms
import           Aitu.Bot.Commands
import           Aitu.Bot.Widgets

import qualified Aitu.Bot.Forms.Content.Content
                                               as C

open :: Peer -> AituBotClient ()
open peer = do
    let
        form = mkBackdropForm Backdrop
            { formId    = "form1"
            , header    = Header { headerType = TOOLBAR
                                 , title      = "FormButton Example"
                                 , options    = defaultHeaderOptions
                                 , formAction = Nothing
                                 }
            , content   = [ C.Content $ Button
                                "Open ya.ru"
                                "button_1"
                                DefaultButton
                                (FormAction OpenUrlAction
                                            (DataTemplate "http://ya.ru")
                                )
                                Nothing
                          ]
            , options   = Just defaultOptions { fullscreen = Just True }
            , bottomBar = Nothing
            }

    sendForm peer form
```

see more examples [here](https://github.com/avatar29A/hs-aitubots-api/tree/master/tutorials/simpleui) 

## Contribution

Contributions are welcome!

1. Fork repository
2. Do your changes
3. Create pull request
4. Wait for CI build and review

You can use `stack` to build library 

```
$ stack build
```

also run tests

Unit Tests

```
$ stack test
```

Integration Tests

```
stack test --test-arguments "--integration -t TOKEN -c CHAT_ID -n BOT_USER_NAME -- HSPEC_ARGS"
```

or alternative

```
$ AITU_BOT_TOKEN=TOKEN AITU_CHAT_ID=CHAT_ID make test-integration
```

where

    * TOKEN is a your bot's token
    * CHAT_ID your user id for emulate communication between you and bot.

# Roadmap

## Methods

- [x] getMe
- [x] [sendMessage](https://btsdigital.github.io/bot-api-contract/SendMessage.html)
- [x] [editMessage](https://btsdigital.github.io/bot-api-contract/EditMessage.html)
- [x] [sendContactMessage](https://btsdigital.github.io/bot-api-contract/SendContactMessage.html)
- [x] [sendUIState](https://btsdigital.github.io/bot-api-contract/SendUiState.html)
- [x] [forwardMessage](https://btsdigital.github.io/bot-api-contract/ForwardMessage.html)
- [x] [deteteMessage](https://btsdigital.github.io/bot-api-contract/DeleteMessage.html)
- [x] [kickFromGroup](https://btsdigital.github.io/bot-api-contract/KickFromGroup.html)
- [x] [changeGroupTitle](https://btsdigital.github.io/bot-api-contract/ChangeGroupTitle.html)
- [x] [changeGroupDescription](https://btsdigital.github.io/bot-api-contract/ChangeGroupDescription.html)
- [x] [changeGroupAvatar](https://btsdigital.github.io/bot-api-contract/ChangeGroupAvatar.html)
- [x] [deleteGroupAvatar](https://btsdigital.github.io/bot-api-contract/ChangeGroupAvatar.html)
- [x] [sendContainerMessage](https://btsdigital.github.io/bot-api-contract/SendContainerMessage.html)
- [x] [editContainerMessage](https://btsdigital.github.io/bot-api-contract/EditContainerMessage.html)
- [x] [retrieveUpdate](https://btsdigital.github.io/bot-api-contract/retrieveUpdate.html)
- [x] [setWebhook](https://btsdigital.github.io/bot-api-contract/setwebhook.html)
- [x] [deleteWebhook](https://btsdigital.github.io/bot-api-contract/deletewebhook.html)
- [x] [getWebhookInfo](https://btsdigital.github.io/bot-api-contract/getwebhookinfo.html)
- [ ] uploadMedia
- [ ] downloadMedia 

## Updates

- [x] [Message](https://btsdigital.github.io/bot-api-contract/message.html)
- [x] [MessageEdited](https://btsdigital.github.io/bot-api-contract/messageedited.html)
- [x] [MessageIdAssigned](https://btsdigital.github.io/bot-api-contract/messageidassigned.html)
- [x] [MessageForwardMetadata](https://btsdigital.github.io/bot-api-contract/messageforwardmetadata.html)
- [x] [QuickButtonSelected](https://btsdigital.github.io/bot-api-contract/quickbuttonselected.html)
- [x] [InlineCommandSelected](https://btsdigital.github.io/bot-api-contract/inlinecommandselected.html)
- [x] [FormSubmitted](https://btsdigital.github.io/bot-api-contract/formsubmitted.html)
- [x] [FormMessageSent](https://btsdigital.github.io/bot-api-contract/formmessagesent.html)
- [x] [FormClosed](https://btsdigital.github.io/bot-api-contract/formclosed.html)
- [x] [InvitedToGroup](https://btsdigital.github.io/bot-api-contract/invitedtogroup.html)
- [x] [KickedFromGroup](https://btsdigital.github.io/bot-api-contract/kickedfromgroup.html)
- [x] [InvitedToChannel](https://btsdigital.github.io/bot-api-contract/invitedtochannel.html)
- [x] [KickedFromChannel](https://btsdigital.github.io/bot-api-contract/kickedfromchannel.html)
- [x] [NewChannelSubscriber](https://btsdigital.github.io/bot-api-contract/newchannelsubscriber.html)
- [x] [ChannelAdminAdded](https://btsdigital.github.io/bot-api-contract/channeladminadded.html)
- [x] [ChannelAdminDeleted](https://btsdigital.github.io/bot-api-contract/channeladmindeleted.html)
- [x] [ChannelPermissionsGranted](https://btsdigital.github.io/bot-api-contract/channelpermissionsgranted.html)
- [x] [ChannelPermissionsRevoked](https://btsdigital.github.io/bot-api-contract/channelpermissionsrevoked.html)

## Forms

- [x] [Form](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Form.hs)
- [x] [Header](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Header.hs)
- [x] [Options](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Options.hs)
- [x] [FlexOptions](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/FlexOptions.hs)
- [x] [FormAction](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/FormAction.hs)
- [x] [Indent](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Indent.hs)
- [x] [ValidationRule](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/ValidationRules.hs)
- [x] Content
    - [x] [Content](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Content.hs)
    - [x] [BottomBar](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/BottomBar.hs)
    - [x] [Button](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Button.hs)
    - [x] [Checkbox](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Checkbox.hs)
    - [x] [DatePicker](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/DatePicker.hs)
    - [x] [Divider](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Divider.hs)
    - [x] [FileMetadata](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/FileMetadata.hs)
    - [x] [Image](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Image.hs)
    - [x] [Input](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Input.hs)
    - [x] [ItemInfo](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/ItemInfo.hs)
    - [x] [LabeledText](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/LabeledText.hs)
    - [x] [MediaPicker](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/MediaPicker.hs)
    - [x] [RadioGroup](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/RadioGroup.hs)
    - [x] [SimpleCatalog](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/SimpleCatalog.hs)
    - [x] [Slider](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Slider.hs)
    - [x] [Submit](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Submit.hs)
    - [x] [Switch](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/Switch.hs)
    - [x] [Text](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/TextWidget.hs)
    - [x] [TextArea](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/TextArea.hs)
    - [x] [UserInfo](https://github.com/avatar29A/hs-aitubots-api/blob/master/src/Aitu/Bot/Forms/Content/UserInfo.hs)
- [ ] Typed Resource Library