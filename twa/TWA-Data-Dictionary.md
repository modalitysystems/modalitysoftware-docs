# Teamwork Analytics Data Dictionary

Modality Systems Teamwork Analytics collects lots of information from various Microsoft Graph API endpoints. This document explains what data is collected and stored. It can be used to inform what reporting is possible.

This document also lists data we have been asked for by customers that we don't collect today and if Microsoft provides it via any API today.

## User Information from Active Directory
Teamwork Analytics collects the following about each user from Azure Active Directory.

These are held in the [Users](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/Users.md) Table in the database and used to filter any per-user activity.

 - Id 
 - GivenName 
 - Surname 
 - JobTitle 
 - OfficeLocation 
 - PreferredLanguage
 - UsageLocation 
 - City 
 - Country 
 - Department
 - UserPrincipalName
 - Mail - SMTP Address
 - Enabled user account
 
 These are held in the [TeamsUserLicences](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/TeamsUserLicences.md) table

 - CapabilityStatus - If a user is Licensed for Teams, Enabled or Disabled

In addition, TWA pulls up to 10 custom Azure AD Attributes each customer can define.

## Per User Teams Usage Information

For each user with any activity, the number of the following actions. This is solely the quantity per user of each activity for that date.
These are held in the [ActivityUserDetails](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/ActivityUserDetails.md) table and used in the Teams Usage reports

- TeamChatMessageCount
- PrivateChatMessageCount
- CallCount
- MeetingCount
- HasOtherAction - Microsoft define this as "any other action"

## Per Team Information

For each team in Microsoft Teams, Teamwork Analytics collects the following information.
### Team Information
List of all the current Teams
- Team Display Name
- Description
- IsArchieved
- Visibility
- CreatedDateTime - when the Team was created
### Channels in each team
The name and description of each channel in the [Channels](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/Channels.md) table
- DisplayName
- Description
### Channel Messages over time
All Channel Messages for the configured period. TWA does not hold the message content, only metadata about the message. Held in [Messages](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/Messages.md) table
- ParentMessageId
- CreatedDateTime
- LastModifiedDateTime - date message was created or modified
- DeletedDateTime
- Importance
- Locale
- ChannelId
- TeamId
- NumberOfGifs
- NumberOfOtherImages
- UserId - user that posted the message
- AppId - the app that posted the message
### Channel Message Reactions
Held in the [Reactions]
(https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/Reactions.md) table
Reactions to channel message, such as thumbs up and smiley face
- MessageId
 - UserId
- Reaction Type
- CreatedDateTime
###  Channel Message @ Mentions
Mentions within channel Messages. In the [Mentions](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/Mentions.md) table
- MessageId
- MentionedUserId
- MentionedAppId
- MentionedChannelId
- MentionText
- TeamId
- ChannelId
### Channel Message Attached files/content
This is any content attached to a channel message. Held in [Attachments](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/Attachments.md) table.
- ContentType
- ContentUrl
- Name
- ThumbnailUrl
- MessageId
### Apps installed in each Team - Current state
This is held in the [Apps](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/Apps.md) table.
 - Name 
 - Version
### Files in each Team - Current state
Details of Files in Each Team (in the SharePoint site associated with the Team). Held in the [DriveItems](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/database%20documentation/Tables/DriveItems.md) table
- FileID
- CreatorEmail
- FileMimeType
- CreatedDateTime
- LastModifiedDateTime

## Data not available from Microsoft Graph
The following data has been asked for but is not currently available from Microsoft Graph.
- Messages read
- Clicks on Tabs/clicks into Apps from Tabs
