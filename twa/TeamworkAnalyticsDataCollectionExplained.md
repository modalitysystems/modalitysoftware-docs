## Teamwork Analytics Data Collection Explained

Teamwork Analytics uses several different API's for each reporting app to collect data, mostly via Microsoft Graph.

All data is not available from a single API, so we often have to combine data sources to get the detail we want for reporting.

This section explains some of the different API's we use and data we collect, and its impact on available reports.

## Microsoft Teams Data Collection

In all cases, we collect metadata of activity (time of posting, channel, team poster, number of posts/reactions) not the actual content of messages.

## Microsoft Teams Data Collection Update Interval

Our process contantly collects data from Microsoft Graph on a loop (to the speed Microsoft allow us before throttling). Once the process has worked through all data and Teams, it immedatgely starts again working through for any changes.

In smaller organisations (a few thousand users) this can take hours, so the data is updated in SQL multiple times a day), in larger customers ~250,000+ this complete update can take up to 24 hours in the worst cases (heveay usage, lots of Microsoft throttling).

From a reporting point of view, the worst case is to assume a 24 to 48 hour latency from time of activity, but typically it is less than this. This accounts for Graph, SQL and Power BI refresh times.

### Teams, Channels, Members, Owners, Guests (channel messages) Detailed Activity Metadata

For Teams/Channels and SharePoint/File Activity, the API's allow us to poll for the actual messages posted in every single channel since each Team and channels creation (provided the data has not been deleted by a retention policy). For this reason, we can report on Team/Channel activity right from when the first team was created in your organisation, straight after install. This data does not need to "build up" like Private Chat, Calls and Meetings data.

It is this detailed activity metadata that lets us report in granular detail on team activity by active directory group. So reports on Team activity will have more detail, more filters and will have history to the extent to which the customer wants to store it.

Our Microsoft Teams reporting uses Microsoft Teams and SharePoint Graph API's to get detailed reports of Microsoft Teams Activity.

### Private Chat, Calls and Meetings (getTeamsUserActivityUserDetail) -  Microsoft Teams Summary Activity Reports and Trends

Microsoft reporting API allows us to specify a date range on this API for which you would like to view the users who performed any activity. This report is only available for the past 30 days. We use this data source as it gives us the user detail which allows us to report in more detail.

The data returned gives us daily user usage information for the 30 day historical period. Meaning at point of install we can report on the previous 30 days. From install forward, we pull this summary daily to get daily change in the database, which then allows us to report weekly and monthly usage/change.

Most notably this is how we get usage information on

- Channel Chat Message Count
- Private Chat Message Count
- Call Count
- Meetings Count

So any report page that reports on Channtl Chat count, Private Chat, Calls or Meetings will initially report on the previous 30 days, then build data over time from when Teamwork Analytics is installed.

Microsoft API's are usually 48 hours behind the current date, but this delay is known to fluctuate especially in large environments. Teamwork Analytics can only report up to the date of the data Microsoft provides. This affects usage trend reporting but not team (the data within about/within a team) reporting.

If you wish to check the current data the API's are providing, you can check/confirm it with this (PowerShell script)[https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/Reporting-API-Freshness-Check.md] or check the standard Office 365 usage reports for their data freshness here https://portal.office.com/adminportal/home#/reportsUsage

Microsoft does provide some usage detail in summary reports. The supported values for collecting a summary period are last 7 days, 30 days, 90 days, and 180 days, relative to the time you pull from the API. These to not breakdown the usage by user on these summary reports so Teamwork Analytics does not use them. Hence only being able to report 30 days into the the past at point of initial install.




