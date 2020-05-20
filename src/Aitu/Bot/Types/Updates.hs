{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Aitu.Bot.Types.Updates (
    Update (..)
    , Updates (..)) where

import Data.Aeson
import Data.Aeson.Types
import Data.Text
import Data.UUID.Types
-- import qualified Data.ByteString.Lazy.Char8 as BC
import Data.Time.Clock (UTCTime)

import Aitu.Bot.Types.Peer (Peer)
import Aitu.Bot.Types.Media (Media)
import Aitu.Bot.Types.ForwardMetadata (ForwardMetadata)

-- Object represents update recieved. UpdateResponse composed of an array of updates.
-- Each update has a type repsenting unique set of data.
-- There are folowing types of updates available:
-- doc: https://btsdigital.github.io/bot-api-contract/updateresponse.html
data Update = 
    -- Message  represents an update about a new message sent to dialog with a service.
    -- doc: https://btsdigital.github.io/bot-api-contract/message.html   
    Message {
        messageUpdateId                             :: UUID
        , messageId                                 :: UUID
        , messageSentAt                             :: UTCTime
        , messageAuthor                             :: Peer
        , messageDialog                             :: Peer
        , messageContent                            :: Text
        , messageForwardMetadata                    :: Maybe ForwardMetadata
        , messageMedia                              :: Maybe [Media]
        , messageLikeCount                          :: Maybe Int
        , messageRepostCount                        :: Maybe Int
        , messageViewCount                          :: Maybe Int
        , messageChannelPostAuthor                  :: Maybe Peer}
    -- This object represents an update about edited message
    -- doc: https://btsdigital.github.io/bot-api-contract/messageedited.html
    | MessageEdited {
        messageEditedUpdateId                       :: UUID
        , messageEditedMessageId                    :: UUID
        , messageEditedAuthor                       :: Peer
        , messageEditedDialog                       :: Peer
        , messageEditedContent                      :: Text} 
    -- This object represents update with a backend ID of the message. in return to sent message with a localID specified.
    -- doc: https://btsdigital.github.io/bot-api-contract/messageidassigned.html
    | MessageIdAssigned {
        messageIdAssignedUpdateId                   :: UUID
        , messageIdAssignedLocalId                  :: UUID
        , messageIdAssignedDialog                   :: Peer
        , messageIdAssignedId                       :: UUID}
    -- This object represents forwarded message data ( in present it's a peer type of message sender).
    -- doc: https://btsdigital.github.io/bot-api-contract/messageforwardmetadata.html
    | MessageForwardMetadata {
        messageForwardMetadataSender                :: Peer}
    --This object represents update about selected quick button. This type of update is returned for QuickRequest action type of QuickButton.
    -- doc: https://btsdigital.github.io/bot-api-contract/quickbuttonselected.html
    | QuickButtonSelected {
        quickButtonSelectedUpdateId                 :: UUID
        , quickButtonSelectedDialog                 :: Peer
        , quickButtonSelectedSender                 :: Peer
        , quickButtonSelectedMetadata               :: Text}
    -- This object represents update about selected inline command.
    -- https://btsdigital.github.io/bot-api-contract/inlinecommandselected.html
    | InlineCommandSelected {
        inlineCmdSelectedUpdateId                   :: UUID
        , inlineCmdSelectedDialog                   :: Peer
        , inlineCmdSelectedSender                   :: Peer
        , inlineCmdSelectedMetadata                 :: Text
        , inlineCmdSelectedContent                  :: Text}
    -- This object represents update about a form being submitted (or selected quickbutton with QUICK_FORM_ACTION type) in a dialog.
    -- doc: https://btsdigital.github.io/bot-api-contract/formsubmitted.html
    | FormSubmitted {
        formSubmittedUpdateId                       :: UUID
        , formSubmittedFormId                       :: UUID
        , formSubmittedDialog                       :: Peer
        , formSubmittedSender                       :: Peer
        , formSubmittedMetadata                     :: Text
        , formSubmittedAdditionalMetadata           :: Text}
    -- This object represents update about message being sent to dialog by the use of quickbutton with QUICK_FORM_ACTION type (no message update is returned).
    -- https://btsdigital.github.io/bot-api-contract/formmessagesent.html
    | FormSentMessage {
        formSentMessageUpdateId                     :: UUID
        , formSentMessageFormId                     :: UUID
        , formSentMessageDialog                     :: Peer
        , formSentMessageSender                     :: Peer
        , formSentMessageMessage                    :: Text
        , formSentMessageMessageId                  :: UUID
        , formSentMessageAdditionalMetadata         :: Text}
    -- This object represents update about form (sent within UiState in SendUiState method) being closed in a client by a user.
    -- doc: https://btsdigital.github.io/bot-api-contract/formclosed.html
    | FormClosed {
        formClosedUpdateId                          :: UUID
        , formClosedFormId                          :: UUID
        , formClosedDialog                          :: Peer
        , formClosedSender                          :: Peer}
    -- This object represents update about adding service to a group dialog. By that fact service becomes new group member.
    -- doc: This object represents update about adding service to a group dialog. By that fact service becomes new group member.
    | InvitedToGroup {
        invitedToGroupUpdateId                      :: UUID
        , invitedToGroupGroupId                     :: UUID}
    -- This object represents update about removing service from a group dialog. By that fact service is removed from group members.
    -- https://btsdigital.github.io/bot-api-contract/kickedfromgroup.html
    | KickedFromGroup {
        kickedFromGroupUpdateId                     :: UUID
        , kickedFromGroupGroupId                    :: UUID}
    -- This object represents update about adding service to a channel as a subcriber.
    -- https://btsdigital.github.io/bot-api-contract/invitedtochannel.html
    | InvitedToChannel {
        invitedToChannelUpdateId                    :: UUID
        , invitedToChannelChannelId                 :: UUID}
    -- This object represents update about removing service from channel subcribers.
    -- doc: https://btsdigital.github.io/bot-api-contract/kickedfromchannel.html
    | KickedFromChannel {
        kickedFromChannelUpdateId                   :: UUID
        , kickedFromChannelChannelId                :: UUID}
    -- This object represents update about adding a new channel subcriber. 
    -- This update is sent to a service with a channel admin role.
    -- https://btsdigital.github.io/bot-api-contract/newchannelsubscriber.html
    | NewChannelSubscriber {
        newChannelSubscriberUpdateId                :: UUID
        , newChannelSubscriberPeer                  :: Peer
        , newChannelSubscriberChannelId             :: UUID}
    -- This object represents an update about adding new channel admin.
    -- This update is sent to a service with a channel admin role.
    -- https://btsdigital.github.io/bot-api-contract/channeladminadded.html
    | ChannelAdminAdded {
        channelAdminAddedUpdateId                   :: UUID
        , channelAdminAddedChannelId                :: UUID
        , channelAdminAddedAdmmin                   :: Peer}
    -- This object represents an update about removing channel admin.
    -- This update is sent to a service with a channel admin role.
    -- https://btsdigital.github.io/bot-api-contract/channeladmindeleted.html
    | ChannelAdminDeleted {
        channelAdminDeletedUpdateId                 :: UUID
        , channelAdminDeletedChannelId              :: UUID
        , channelAdminDeletedAdmin                  :: Peer}
    -- This object represents an update about adding a service to channel admins if service isn't a channel admin or editing admin permissions if service is already a channel admin.
    -- This update is sent to a service with a channel admin role.
    -- https://btsdigital.github.io/bot-api-contract/channelpermissionsgranted.html
    | ChannelPermissonGranted {
        channelPermissonGrantedUpdateId             :: UUID
        , channelPermmissionGrantedChannel          :: Peer
        , channelPermissionGrantedPermissions       :: [Text]}
    -- This object represents an update about a service being revoked a channel admin role 
    -- https://btsdigital.github.io/bot-api-contract/channelpermissionsrevoked.html
    | ChannelPermissonRevoked {
        channelPermissionRevokedUpdateId            :: UUID
        , channelPermissionRevokedChannelId         :: UUID}
        deriving (Show)

instance FromJSON Update where
    parseJSON = withObject "update" $ \o -> do
        (ty :: Text) <- o .: "type"
        case ty of
            "Message" -> Message <$> o .: "updateId"
                <*> o .: "messageId"
                <*> o .: "sentAt"
                <*> o .: "author"
                <*> o .: "dialog"
                <*> o .: "content"
                <*> o .:? "forwardMetadata"
                <*> o .:? "media"
                <*> o .:? "likeCount"
                <*> o .:? "repostCount"
                <*> o .:? "viewCount"
                <*> o .:? "channelPostAuthor"
            "MessageEdited" -> MessageEdited <$> o .: "updateId"
                <*> o .: "messageId"
                <*> o .: "author"
                <*> o .: "dialog"
                <*> o .: "content"
            "MessageIdAssigned" -> MessageIdAssigned <$> o .: "updateId"
                <*> o .: "localId"
                <*> o .: "dialog"
                <*> o .: "id"
            "MessageForwardMetadata" -> MessageForwardMetadata 
                <$> o .: "sender"
            "QuickButtonSelected" -> QuickButtonSelected <$> o .: "updateId"
                <*> o .: "dialog"
                <*> o .: "sender"
                <*> o .: "metadata"
            "InlineCommandSelected" -> InlineCommandSelected <$> o .: "updateId"
                <*> o .: "dialog"
                <*> o .: "sender"
                <*> o .: "metadata"
                <*> o .: "content"
            "FormSubmitted" -> FormSubmitted <$> o .: "updatedId"
                <*> o .: "formId"
                <*> o .: "dialog"
                <*> o .: "sender"
                <*> o .: "metadata"
                <*> o .: "additionalMetadata"
            "FormMessageSent" -> FormSentMessage <$> o .: "updateId"
                <*> o .: "formId"
                <*> o .: "dialog"
                <*> o .: "sender"
                <*> o .: "message"
                <*> o .: "messageId"
                <*> o .: "additionalMetadata"
            "FormClosed" -> FormClosed <$> o .: "updateId"
                <*> o .: "formId"
                <*> o .: "dialog"
                <*> o .: "sender"
            "InvitedToGroup" -> InvitedToGroup <$> o .: "updateId"
                <*> o .: "groupId"
            "KickedFromGroup" -> KickedFromGroup <$> o .: "updateId"
                <*> o .: "groupId"
            "InvitedToChannel" -> InvitedToChannel <$> o .: "updateId"
                <*> o .: "channelId"
            "KickedFromChannel" -> KickedFromChannel <$> o .: "updateId"
                <*> o .: "channelId"
            "NewChannelSubscriber" -> NewChannelSubscriber <$> o .: "updateId"
                <*> o .: "peer"
                <*> o .: "channelId"
            "ChannelAdminAdded" -> ChannelAdminAdded <$> o .: "updateId"
                <*> o .: "channelId"
                <*> o .: "admin"
            "ChannelAdminDeleted" -> ChannelAdminDeleted <$> o .: "updateId"
                <*> o .: "channelId"
                <*> o .: "admin"
            "ChannelPermissonGranted" -> ChannelPermissonGranted <$> o .: "updateId"
                <*> o .: "channel"
                <*> o .: "permissions"
            "ChannelPermissionRevoked" -> ChannelPermissonRevoked <$> o .: "updateId"
                <*> o .: "channelId"
            _ -> fail "unknown field"

newtype Updates = Updates {
    updates :: [Update]
} deriving (Show)

instance FromJSON Updates where
    parseJSON (Object v) =
        Updates <$> v .: "updates"