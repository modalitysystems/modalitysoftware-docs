# Teamwork Analytics - Data Collected and Capabilities

Modality Teamwork Analytics collects the following data (across multiple modules) which allows various combinations of useful reports and automation triggers. For the sake of simplicity of this document, if something can be reported on, it could also be a trigger for an automated message to users. Automated messages are used to drive governance, best practice advice and adoption.

It is useful to understand that the data collected and stored can be broken down into two types.

- **Current State Data** - Where we are polling graph regularly (looping at least daily) and storing the current state information, but we are not storing a history of changes in that information

- **Historical Change Data** - Mainly for per-user usage data, we collect the per day usage information for each user for every day and store that 

Understanding the data TWA collected and stored, helps inform the reporting and automation capabilities.


## Current State Data

This data is collected on a continuous loop, and TWA stores the correct, current information, but not a record of historical changes, e.g. TWA can tell you the current owners of a team, but not the changes in ownership over time

### Active Directory Attributes for users

Throughout the reporting Active Directroy Attributes are used to group users for reporting purposes. 

TWA collects the following attributes for all users by default

In addition, TWA can collect up to 10 additional Active Directory attributes, including extended attributes that customers can define.

For any report involving users, they can be grouped by that attribute.

Example Capabilities
- Which teams are directors members of
- How many meetings are UK users attending
- What percentage of France users are high calling users

### FURURE (LION) - User current Microsoft Teams Licence/Enabled Status

TWA records if an AD user is enabled for Microsoft Teams (licenced).

Example Capabilities
- Report on the number of licenced users vs users using Teams, e.g. There are 1,000 UK users and 66% have attended a meeting in X period

### Team owners, members and guests

This allows reporting on the current numbers and names of owners, members and guests.

Example Capabilities
- Report on teams with guests, who the guests are and how active they are
- Report on the number of owners in particular AD groups
- Report on tams with no owners
- Report on teams with only one member


### Metadata for all current team channel messages, replies and reactions

Key to TWA reporting, TWA collects metadata for all messages, replies and reactions in all team channels.

Example Capabilities
- Report on active/inactive teams/channels
- Report on who is active in a team vs who are members
- Report on which teams any AD group are active in
- Report on which teams guest is active in
- Report on which AD groups re-engaging with which other AD groups in teams

## FUTURE Current State

These are currently in preview or being added to the product
- File metadata


## Historical Change Data

This data is collected and stored as records against a point in time. It enables the reporting of change over time. This mainly related to users usage of Microsoft Teams.

For each user, Microsoft Graph API gives us the number of chat messages, channel messages, calls, meetings attended and "other actions" each day.

- Chat messages - the number of messages not message sessions
- Channel messages - the number of channel messages/replies
- Meetings attended - not organised/scheduled, but attended per user, so a meeting of 5 people will log as each of them attending once
- Other actions -  Any activity on the Microsoft Teams application panel will mark the user as having "other actions", like reading a message, clicking anywhere on the panel/application and even events like maximising the app or clicking on settings
