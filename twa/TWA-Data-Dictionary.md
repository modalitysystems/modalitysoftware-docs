# Teamwork Analytics Data Dictionary and Reporting Capabilities

Modality Systems Teamwork Analytics collects lots of information from various Microsoft Graph API endpoints. This document explains what data is collected and stored. It can be used to inform what reporting is possible with the solution.

If data is not listed on this page, it is not currently collected. This document also lists data we have been asked for by customers that we don't collect today and if Microsoft provides it via any API today. If you have suggestions for other data you would like to see collected/reported on, please email software.support@modalitysystems.com

## Full Database and Power BI documentation

There is full documentation of the datahase [here](database%20documentation/Tables/Tables), and the Power BI model [here](powerbi/model-documentation/PowerBI-Model)

## Reporting Capabilities

Power BI allows us to report on any combination of the below informaiton. We can filter information by user, user attributes or teams

# Information collected and avilable in Teamwork Analytics Usage and Governance Reports

## User Information from Azure Active Directory
Teamwork Analytics collects the following about each user from Azure Active Directory.

These are held in the [Users](database%20documentation/Tables/Users) Table in the database and used to filter any per-user activity.

 - UserId
 - Given Name 
 - Surname 
 - Job Title 
 - Office Location 
 - Preferred Language
 - Location 
 - City 
 - Country 
 - Department
 - User Principal Name
 - Mail - SMTP Address
 - Is Enabled user account
 
 These are held in the [TeamsUserLicences](database%20documentation/Tables/TeamsUserLicences) table

 - Teams Licennce Capability Status - If a user is Licensed for Teams, Enabled or Disabled

In addition, TWA pulls up to 10 custom Azure AD Attributes each customer can define. These are bispoke per customer.

## Per User, Teams Usage Information (counts of activity)

For each user with any activity, the number of the following actions. This is solely the quantity per user of each activity for that date.
These are held in the [ActivityUserDetails](database%20documentation/Tables/ActivityUserDetails) table and used in the Teams Usage reports

- Team Chat Message Count
- Private Chat Message Count
- Call Count
- Meeting Count
- Has Other Action - Microsoft define this as "any other action"

These are counts per day, so for any single date we can tell what a users activity count has been for each of the above activities. It is a simple count with no detail as to audio/video start/end times or details of who was communicating with who.

## Per Microsoft Teams Team Information
For each team in Microsoft Teams, Teamwork Analytics collects the following information.

### Team Information
List of all the current Teams
- Team Display Name
- Description
- Is Archieved
- Visibility
- Team Created Date Time - when the Team was created

### Channels in each team
The name and description of each channel in the [Channels](database%20documentation/Tables/Channels) table
- Display Name
- Description

For this we have the current state/count of channels, but not change over time.

### Channel Messages over time
All Channel Messages for the configured period. TWA does not hold the message content, only metadata about the message. Held in [Messages](database%20documentation/Tables/Messages) table
- Parent MessageId
- Message Created Date Time
- Last Modified Date Time - date message was created or modified
- Deleted Date Time
- Importance
- Locale
- ChannelId
- TeamId
- Number Of Gifs in the message
- Number Of Other Images in the message
- UserId - user that posted the message
- AppId - the app that posted the message

### Channel Message Reactions
Held in the [Reactions]
(database%20documentation/Tables/Reactions.md) table
Reactions to channel message, such as thumbs up and smiley face
- MessageId
- UserId
- Reaction Type
- Created Date Time

###  Channel Message @ Mentions
Mentions within channel Messages. In the [Mentions](database%20documentation/Tables/Mentions) table
- MessageId
- Mentioned UserId
- Mentioned AppId
- Mentioned ChannelId
- Mention Text
- TeamId
- ChannelId

### Channel Message Attached files/content
This is any content attached to a channel message. Held in [Attachments](database%20documentation/Tables/Attachments) table.
- Content Type
- Content Url
- Name
- Thumbnail Url
- MessageId

### Apps installed in each Team - Current state
This is held in the [Apps](database%20documentation/Tables/Apps table.
 - Name 
 - Version Number
 
### Files in each Team - Current state
Details of Files in Each Team (in the SharePoint site associated with the Team). Held in the [DriveItems](database%20documentation/Tables/DriveItems) table
- FileID
- Creator Email
- File Mime Type
- Created Date Time
- Last Modified Date Time

# Data not available from Microsoft Graph
The following data has been asked for but is not currently available from Microsoft Graph.
- Messages read (count or date time)
- Clicks on Tabs/clicks into Apps from Tabs
- Usage time of specific apps
- Buttons client in the client
- Links clicked/followed in messages
- Number of federatated messages
- Split of number of PSTN calls and number of VoIP calls - it's a single call count
