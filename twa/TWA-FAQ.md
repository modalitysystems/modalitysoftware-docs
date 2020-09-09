## How does Teamwork Analytics deal with Microsoft Graph Throttling?

Teamwork Analytics pulls data from Microsoft Graph via HTTPS. The Teamwork Analytics windows service has 4 concurrent https clients that can run with request up twice per second. However, Microsoft Graph throttles requests to an appropriate speed for Microsoft which means Teamwork Analytics does not always reach its theoretical maximum speed of data collection.

We follow Microsoft guidance which states "When throttling occurs, Microsoft Graph returns HTTP status code 429 (Too many requests), and the requests fail. A suggested wait time is returned in the response header of the failed request.". We respect this suggested wait time in line with best practice.

Microsoft publish what their limits are for Graph for Microsoft Teams. Here is their documentation: https://docs.microsoft.com/en-us/graph/throttling

Customers cannot control this behaviour, it is automatically handled in the Teamwork Analytics application.

## How does Modality Systems Teamwork Analytics count Users

Modality Systems calculates the total user count by iterating all Azure AD user accounts, including those that have no Teams activity.

## How does Modality Systems Teamwork Analytics define an Active user?

Active Users are defined differently depending on the report you are using.

For overall Teams Usage, an active user is a user which meets any of the following criteria for the date range selected in the report;
 - Made at least 1 Teams Call
 - Joined at least 1 Teams Meeting
 - Sent at least 1 Teams Channel Message
 - Sent at least 1 Teams Chat Message

For Teams Collaboration and Governance, an active user is one which has **sent a message** to a channel (e.g. in a Team) in the **last 30 days (by default)**. It was a deliberate decision to focus on "active for collaboration" for these reports.

To change the default value of 30 days, edit the `TeamActivityRangeInDays` column in the `configuration.ReportingConstants` table using Microsoft SQL Server Management Studio. This table only has one row.

| Id | TeamActivityRangeInDays |
| -- | ----------------------- |
| 1  | 30                      |

The Microsoft definition of Active User changes depending on the report being viewed. For more information, see [Microsoft Teams analytics and reporting](https://docs.microsoft.com/en-us/microsoftteams/teams-analytics-and-reports/teams-reporting-reference).


## How does Modality Systems Teamwork Analytics define a Guest User?

Modality Systems defines a Guest User as any user that is not homed on your tenant. This includes federated users as well as guests that join meetings, contribute to teams etc.

Microsoft Teams Admin Center, Office 365 and PowerShell do not consider federated users guest users.

This difference in definition can cause differences in the reported number of guest users when comparing figures from Teamwork Analytics and Microsoft. The difference is because Teamwork Analytics is more inclusive in its guest definition - as a reporting and compliance management tool having a list of all users that are not from your organisation enables you to see the true scale of external communication.

## How does Modality Systems Teamwork Analytics define an Active Channel?

An Active Channel is defined as having channel activity in the last 30 days.

## What's a Licenced Teams user?

Both Microsoft and Modality Systems use the term 'Licenced Teams User' in reporting. Both definitions are the same and refer explicitly to the teams checkbox, or lack thereof, in the user licencing tab of the Microsoft 365 admin portal.

see [Microsoft Teams licencing](https://docs.microsoft.com/en-us/microsoftteams/user-access).

**Not** to be confused with Teamwork Analytics Licence Keys below.


## How do Modality Systems Teamwork Analytics Licence Keys work?

For Teamwork Analytics backend to run you will need an active and current licence key from Modality Systems. To get a key for a trial please contact trial.support@modalitysystems.com. Paid customers will get their key issued at time of purchase.

The key is unique to each customer and defines which Teamwork Analytics modules are enabled. It is time-bound to the agreed licence term. There is no licence key on the PowerBI Apps. If a key expires, data will stop being collected, but existing data will not be deleted. PowerBI Apps will continue to work on the existing data. For up to 28 days, If a valid licence is added, the data missed during the period of no licence will be collected and added as part of the collection process. 28 days is the limit Microsoft give for pulling some of the daily statistics we use, after 28 days we will still collect most data, but some statistics on usage may have gaps.

The key is input at the time of deploying the ARM Template or the manual Powershell install.

If you need to update or input a new key, you can re-run the ARM Template or PowerShell installer, or edit the field manually in the configuration file: C:\Program Files\Modality\GraphETL\Modality.Graph.Etl.SingleTenant.Service.exe.config

![TWA Licence Key](images/TWAKey.png)

## Can you report on usage of apps pinned in Teams, like OneNote or Planner?

Teamwork Analytics can report on which apps have been added as a tab in teams/channels, but not their actual amount of usage, either usage from with teams (e.g. how often a tab is used) or usage of the app regardless of use being inside or outside of Teams, .e.g. how often a OneNote is used.

If customers have the requirement, we can investigate what usage reporting Office 365 or third party apps have available via API and if we could make PowerBI usage reports for them. Please contact us to discuss this requirement.

## How do Teamwork Analytics Version numbers work?

The TWA database, Graph data collection engine, PowerBI Apps and Bot notification service each have unique version numbers for every released build. Version numbers are in the format YYYY.MM.DD.MinorBuildNumber - so 2020.1.8.2 is 8th January 2020 minor build 2. This allows easy tracking of issues and improvements.

## Improving Reporting Performance

Depending on the size of your Teams ecosystem, you may find issues with reporting and collecting data at the same time. This is manifested in issues refreshing PowerBI reports. To rectify these issues, Modality recommends either increasing the SQL tier in Microsoft Azure, or setting up [Active Geo Replication](https://docs.microsoft.com/en-us/azure/azure-sql/database/active-geo-replication-overview) and using the readable replica for reporting.
